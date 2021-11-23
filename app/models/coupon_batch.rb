# frozen_string_literal: true

class CouponBatch < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  validates :display_name,
            presence: true
  validates :coupon_count,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 1000,
              only_integer: true
            }

  belongs_to :survey
  alias parent survey
  has_many :coupons
  with_collection :coupons

  collection_options(
    display: :table
  )
  with_columns default: [
    Vocab.schema.name,
    Vocab.argu[:couponCount],
    Vocab.schema.dateCreated
  ]

  before_create :generate_tokens

  private

  def generate_coupon
    self.coupons << Coupon.new(coupon_batch: self, token: generate_token)
  end

  def generate_token
    token = SecureRandom.urlsafe_base64(128).upcase.scan(/[123456789ACDEFGHJKLMNPQRTUVWXYZ]+/).join
    token.length >= 8 ? token[0...8] : generate_token
  end

  def generate_tokens
    coupon_count.times { generate_coupon }
  end

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        display_name: Time.current.strftime('%d-%m-%Y %k:%M'),
        survey: opts[:parent]
      )
    end
  end
end

