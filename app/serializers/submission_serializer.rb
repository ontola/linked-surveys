# frozen_string_literal: true

class SubmissionSerializer < ApplicationSerializer
  has_one :survey, predicate: Vocab.app[:survey]
  attribute :session_id, predicate: Vocab.app[:session_id]
  enum :status, predicate: Vocab.app[:submissionStatus]
  with_collection :submission_values, predicate: Vocab.app[:submissionData]
end
