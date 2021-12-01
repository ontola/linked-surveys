# frozen_string_literal: true

class FieldOptionPolicy < ApplicationPolicy
  permit_attributes %i[custom_form_field label predicate order]

  delegate :update?, to: :parent_policy
  alias create? update?
  alias destroy? update?
end
