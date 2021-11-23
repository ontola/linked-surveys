# frozen_string_literal: true

class Submission < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable

  belongs_to :survey, required: true
  alias parent survey

  has_many :submission_values,
           autosave: true,
           dependent: :destroy
  with_collection :submission_values

  collection_options(
    display: :table
  )
  with_columns default: [
    Vocab.schema.dateCreated,
    Vocab.app[:submissionStatus],
    Vocab.app[:submissionData]
  ]

  enum status: {
    submission_active: 0,
    submission_finished: 1
  }

  def added_delta
    [
      invalidate_resource_delta(parent.submission_collection.action(:create)),
      invalidate_resource_delta(parent.menu(:settings))
    ]
  end

  def body_graph=(graph)
    submission_values.each(&:mark_for_destruction)
    graph&.each_statement do |statement|
      submission_values << SubmissionValue.new(
        submission: self,
        predicate: statement.predicate,
        value: statement.object.to_s,
        value_type: statement.object,
      )
    end
  end

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        session_id: opts[:user_context].id, # @todo
        survey: opts[:parent]
      )
    end
  end
end
