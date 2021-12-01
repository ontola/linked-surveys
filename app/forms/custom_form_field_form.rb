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
  CustomFormField::OPTION_TYPES.each do |type|
    has_many :field_options,
             if: has_type(type),
             max_count: 99
  end
  %i[textAreaInput markdownInput textInput emailInput multipleEmailInput].each do |type|
    field :placeholder, if: has_type(type)
  end
  %i[passwordInput textAreaInput markdownInput textInput multipleEmailInput].each do |type|
    field :min_length, if: has_type(type)
    field :max_length, if: has_type(type)
  end
  %i[numberInput sliderInput].each do |type|
    field :min_inclusive, if: has_type(type)
    field :max_inclusive, if: has_type(type)
  end
  field :min_count, if: has_any_type
  field :max_count, if: has_any_type

  hidden do
    field :order
  end
end
