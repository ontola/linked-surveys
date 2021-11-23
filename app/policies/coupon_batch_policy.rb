# frozen_string_literal: true

class CouponBatchPolicy < ApplicationPolicy
  permit_attributes %i[coupon_count display_name]

  delegate :update?, to: :parent_policy
  alias create? update?
  alias destroy? update?
end
