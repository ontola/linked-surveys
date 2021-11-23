# frozen_string_literal: true

class CustomFormFieldForm < ApplicationForm
  def self.has_any_type
    [
      LinkedRails::SHACL::PropertyShape.new(
        path: [Vocab.argu[:formFieldType]],
        min_count: 1
      )
    ]
  end

  def self.has_type(type)
    [
      LinkedRails::SHACL::PropertyShape.new(
        path: [Vocab.argu[:formFieldType]],
        has_value: -> {
          LinkedRails::EnumValue.new(klass: CustomFormField, key: type, attr: :form_field_type).iri
        }
      )
    ]
  end

  field :form_field_type
  field :title, if: has_any_type
  field :description, if: has_any_type
  field :helper_text, if: has_any_type
  %i[checkboxGroup radioGroup selectInput toggleButtonGroup].each do |type|
    field :sh_in, if: has_type(type)
  end
  %i[passwordInput textAreaInput markdownInput textInput].each do |type|
    field :max_length, if: has_type(type)
    field :min_length, if: has_type(type)
  end
  %i[numberInput sliderInput].each do |type|
    field :max_inclusive, if: has_type(type)
    field :min_inclusive, if: has_type(type)
  end
  field :max_count, if: has_any_type
  field :min_count, if: has_any_type
end
