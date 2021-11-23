# frozen_string_literal: true

class SubmissionValueSerializer < ApplicationSerializer
  attribute :submission, predicate: Vocab.app[:submission]
  attribute :predicate, predicate: Vocab.app[:predicate]
  attribute :value, predicate: Vocab.app[:value]
end
