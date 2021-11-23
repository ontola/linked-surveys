# frozen_string_literal: true

class CouponSerializer < ApplicationSerializer
  attribute :token, predicate: Vocab.app[:token]
  attribute :used, predicate: Vocab.app[:used], datatype: Vocab.xsd.boolean
end
