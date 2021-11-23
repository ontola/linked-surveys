# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :coupon_batch
  alias parent coupon_batch

  collection_options(
    page_size: 1000
  )
  filterable Vocab.app[:used] => boolean_filter(
    ->(scope) { scope.where.not(used_at: nil) },
    ->(scope) { scope.where(used_at: nil) }
  )

  def used
    used_at.present?
  end
end
