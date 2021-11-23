# frozen_string_literal: true

class SubmissionSerializer < ApplicationSerializer
  secret_attribute :coupon, predicate: Vocab.app[:coupon]
  attribute :require_coupon, predicate: Vocab.app[:requireCoupon]
  attribute :session_id, predicate: Vocab.app[:sessionId]
  has_one :survey, predicate: Vocab.app[:survey]
  enum :status, predicate: Vocab.app[:submissionStatus]
  with_collection :submission_values, predicate: Vocab.app[:submissionData]
end
