# frozen_string_literal: true

class SubmissionPolicy < ApplicationPolicy
  permit_attributes %i[survey session_id status]

  def create?
    true
  end

  def update?
    return forbid_with_status(Vocab.schema.CompletedActionStatus) if completed?

    current_session?
  end

  def destroy?
    false
  end

  private

  def completed?
    record.submission_finished? && record.status_was != 'submission_active'
  end

  def current_session?
    user_context.id.to_s == record.session_id
  end
end
