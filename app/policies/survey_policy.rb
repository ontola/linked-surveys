# frozen_string_literal: true

class SurveyPolicy < ApplicationPolicy
  permit_attributes %i[title description starts_at ends_at reward custom_form_id]

  def create?
    true # @todo
  end

  def update?
    true # @todo
  end
end
