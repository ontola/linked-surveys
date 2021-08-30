# frozen_string_literal: true

class SubmissionValueSerializer < ApplicationSerializer
  attribute :submission, predicate: LinkedRails.app_vocab[:submission]
  attribute :predicate, predicate: LinkedRails.app_vocab[:predicate]
  attribute :value, predicate: LinkedRails.app_vocab[:value]
  attribute :valueType, predicate: LinkedRails.app_vocab[:valueType]
end
