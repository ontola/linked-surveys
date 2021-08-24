# frozen_string_literal: true

class CustomFormFieldForm < ApplicationForm
  def self.has_type(*types)
    types.map do |type|
      LinkedRails::SHACL::PropertyShape.new(
        path: [NS.argu[:formFieldType], NS.skos.exactMatch],
        has_value: -> { NS.form[type] }
      )
    end
  end

  term_field :form_field_type_id,
             :formFields,
             min_count: 1,
             sh_in_opts: {page_size: 99}
  field :order
  field :display_name
  field :description
  field :helper_text
  %i[CheckboxGroup RadioGroup SelectInput ToggleButtonGroup].each do |type|
    field :sh_in, if: has_type(type)
  end
  %i[EmailInput PasswordInput TextAreaInput MarkdownInput TextInput].each do |type|
    field :min_length, if: has_type(type)
    field :max_length, if: has_type(type)
  end
  %i[NumberInput SliderInput].each do |type|
    field :min_inclusive, if: has_type(type)
    field :max_inclusive, if: has_type(type)
  end
  field :min_count
  field :max_count

  group :advanced, label: -> { I18n.t('forms.advanced') } do
    field :predicate
  end
end

# CheckboxGroup
# CheckboxInput
# ColorInput
# DateInput
# DateTimeInput
# EmailInput
# FileInput
# LocationInput
# MarkdownInput
# MoneyInput
# MultipleEmailInput
# NumberInput
# PasswordInput
# PostalRangeInput
# RadioGroup
# ResourceField
# SelectInput
# SliderInput
# TextAreaInput
# TextInput
# ToggleButtonGroup
