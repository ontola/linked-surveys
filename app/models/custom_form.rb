# frozen_string_literal: true

class CustomForm < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  belongs_to :user, required: true
  has_many :custom_form_fields
  has_many :surveys, dependent: :restrict_with_exception

  with_collection :custom_form_fields

  class << self
    def build_new(parent: nil, user_context: nil)
      instance = super
      instance.user = user_context
      instance
    end
  end
end
