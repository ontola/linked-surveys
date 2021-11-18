# frozen_string_literal: true

class SurveyForm < ApplicationForm
  field :title
  field :description
  field :starts_at
  field :ends_at
  field :reward
end
