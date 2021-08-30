# frozen_string_literal: true

class SubmissionSerializer < ApplicationSerializer
  attribute :session_id, predicate: LinkedRails.app_vocab[:session_id]
  attribute :survey, predicate: LinkedRails.app_vocab[:survey]
  attribute :status, predicate: LinkedRails.app_vocab[:status]
end
