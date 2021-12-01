# frozen_string_literal: true

class CustomFormFieldPolicy < ApplicationPolicy
  permit_attributes %i[form_field_type title description helper_text default_value max_count min_count max_inclusive
                       min_inclusive max_length min_length pattern predicate order placeholder]
  permit_nested_attributes %i[field_options]

  delegate :update?, to: :parent_policy
  alias create? update?
  alias destroy? update?
end
