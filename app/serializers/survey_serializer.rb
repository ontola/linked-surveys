# frozen_string_literal: true

class SurveySerializer < ApplicationSerializer
  attribute :title, predicate: Vocab.schema.name
  attribute :description, predicate: Vocab.schema.text
  has_one :custom_form, predicate: Vocab.ll.actionBody
  attribute :starts_at, predicate: Vocab.schema.startDate
  attribute :ends_at, predicate: Vocab.schema.endDate
  attribute :reward, predicate: LinkedRails.app_vocab[:reward]

  with_collection :submissions, predicate: LinkedRails.app_vocab[:submissions]
end
