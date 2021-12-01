# frozen_string_literal: true

class FieldOptionSerializer < ApplicationSerializer
  has_one :custom_form_field, predicate: Vocab.app[:customFormField]
  attribute :label, predicate: Vocab.schema.name
  attribute :predicate, predicate: Vocab.app[:predicate]
  attribute :order, predicate: Vocab.argu[:order]
end
