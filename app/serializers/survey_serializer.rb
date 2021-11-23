# frozen_string_literal: true

class SurveySerializer < ApplicationSerializer
  has_one :custom_form, predicate: Vocab.ll.actionBody
  attribute :title, predicate: Vocab.schema.name
  attribute :description, predicate: Vocab.schema.text
  attribute :starts_at, predicate: Vocab.schema.startDate
  attribute :ends_at, predicate: Vocab.schema.endDate
  attribute :reward, predicate: Vocab.app[:reward]
  with_collection :submissions
end
