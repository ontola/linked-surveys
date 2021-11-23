# frozen_string_literal: true

class CouponBatchSerializer < ApplicationSerializer
  attribute :display_name, predicate: Vocab.schema.name
  attribute :coupon_count, predicate: Vocab.app[:couponCount]
  attribute :active_coupons, predicate: Vocab.app[:coupons] do |object|
    object.collection_iri(:coupons, filter: {Vocab.app[:used] => [false]})
  end
  attribute :used_coupons, predicate: Vocab.app[:usedCoupons] do |object|
    object.collection_iri(:coupons, filter: {Vocab.app[:used] => [true]})
  end
end
