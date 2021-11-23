# frozen_string_literal: true

class Survey < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  belongs_to :custom_form, required: false, dependent: :destroy
  belongs_to :user, required: true
  has_many :coupon_batches, dependent: :destroy
  has_many :submissions, dependent: :destroy
  with_collection :submissions
  with_collection :coupon_batches

  validates :description, length: {maximum: 20_000}

  def has_reward?
    reward.positive?
  end

  def submission_for(user_context)
    return nil if user_context.nil?

    submissions.reorder(created_at: :desc).find_by(session_id: user_context.id)
  end

  class << self
    def build_new(parent: nil, user_context: nil)
      return super if user_context.guest?

      instance = super
      instance.user = user_context
      instance.build_custom_form(user: user_context)
      instance
    end
  end
end
