# frozen_string_literal: true

class FieldOptionForm < ApplicationForm
  field :label, label: ''

  hidden do
    field :order
  end
end
