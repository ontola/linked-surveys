# frozen_string_literal: true

class Survey < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  belongs_to :custom_form, required: false, dependent: :destroy
  belongs_to :user, required: true

  validates :description, length: {maximum: 20_000}

  class << self
    def build_new(parent: nil, user_context: nil)
      instance = super
      instance.user = user_context
      instance.build_custom_form(user: user_context)
      instance
    end
  end
end
