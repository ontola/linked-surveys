# frozen_string_literal: true

class Survey < ApplicationRecord
  enhance LinkedRails::Enhancements::Actionable
  enhance LinkedRails::Enhancements::Menuable
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  belongs_to :custom_form, required: true
  has_many :submissions, dependent: :destroy
  with_collection :submissions

  validates :description, length: {maximum: 20_000}
end
