# frozen_string_literal: true

class CouponBatchForm < ApplicationForm
  field :display_name
  field :coupon_count, input_field: LinkedRails::Form::Field::NumberInput
end
