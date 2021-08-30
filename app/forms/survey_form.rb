# frozen_string_literal: true

class SurveyForm < ApplicationForm
  field :title
  field :description
  field :custom_form_id,
        datatype: Vocab.xsd.string,
        input_field: LinkedRails::Form::Field::SelectInput,
        sh_in: -> { CustomForm.root_collection.iri }
  field :starts_at
  field :ends_at
  field :reward
end
