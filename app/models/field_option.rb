# frozen_string_literal: true

class FieldOption < ApplicationRecord
  belongs_to :custom_form_field, required: true
  alias parent custom_form_field
  collection_options(
    default_sortings: [{key: Vocab.argu[:order], direction: :asc}]
  )
  acts_as_list column: :order, scope: :custom_form_field

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        custom_form_field: opts[:parent]
      )
    end
  end
end
