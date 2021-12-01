# frozen_string_literal: true

class SubmissionValue < ApplicationRecord
  belongs_to :submission, required: true

  attribute :predicate, LinkedRails::Types::IRI.new
  attribute :value_type, LinkedRails::Types::IRI.new

  collection_options(
    display: :table
  )
  with_columns default: [
    Vocab.app[:predicate],
    Vocab.app[:value]
  ]

  def value
    return RDF::URI(super) if value_type == Vocab.xsd.anyURI

    RDF::Literal.new(super, datatype: value_type)
  end
end
