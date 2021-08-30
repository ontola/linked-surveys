# frozen_string_literal: true

class SubmissionValue < ApplicationRecord
  belongs_to :submission, required: true
end
