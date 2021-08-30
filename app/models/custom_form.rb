# frozen_string_literal: true

class CustomForm < ApplicationRecord
  enhance LinkedRails::Enhancements::Actionable
  enhance LinkedRails::Enhancements::Menuable
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  has_many :custom_form_fields
  with_collection :custom_form_fields

  has_many :surveys, dependent: :restrict_with_exception
end
