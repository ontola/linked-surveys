# frozen_string_literal: true

class CustomFormPolicy < ApplicationPolicy
  permit_attributes %i[title]

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
