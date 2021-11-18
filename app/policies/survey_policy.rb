# frozen_string_literal: true

class SurveyPolicy < ApplicationPolicy
  permit_attributes %i[custom_form title description starts_at ends_at reward]

  def create?
    true
  end

  def update?
    user_context == record.user
  end

  def destroy?
    user_context == record.user
  end
end
