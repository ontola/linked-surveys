# frozen_string_literal: true

class CustomFormPolicy < ApplicationPolicy
  permit_attributes %i[title]

  def create?
    true # @todo
  end

  def update?
    true # @todo
  end
end
