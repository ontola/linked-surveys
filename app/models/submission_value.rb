# frozen_string_literal: true

class SubmissionValue < ApplicationRecord
  belongs_to :submission, required: true

  attribute :predicate, LinkedRails::Types::IRI.new

  collection_options(
    display: :table
  )
  with_columns default: [
    Vocab.app[:predicate],
    Vocab.app[:value]
  ]

  def value
    RDF::Literal.new(super, datatype: value_type)
  end
end
