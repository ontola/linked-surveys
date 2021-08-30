# frozen_string_literal: true

class Submission < ApplicationRecord
  enhance LinkedRails::Enhancements::Actionable
  enhance LinkedRails::Enhancements::Creatable

  belongs_to :survey, required: true

  enum status: {
    submission_active: 0,
    submission_finished: 1
  }

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
