# frozen_string_literal: true

class SubmissionValuePolicy < ApplicationPolicy
  permit_attributes %i[submission predicate value value_type]

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
