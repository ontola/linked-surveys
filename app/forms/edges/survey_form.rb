# frozen_string_literal: true

class SurveyForm < ContainerNodeForm
  def self.is_local
    LinkedRails::SHACL::PropertyShape.new(
      path: NS.argu[:formType],
      has_value: -> { SurveySerializer.enum_options(:form_type)[:local].iri }
    )
  end

  def self.is_remote
    LinkedRails::SHACL::PropertyShape.new(
      path: NS.argu[:formType],
      has_value: -> { SurveySerializer.enum_options(:form_type)[:remote].iri }
    )
  end

  field :display_name
  field :description, datatype: NS.fhir[:markdown]
  field :form_type, input_field: LinkedRails::Form::Field::ToggleButtonGroup, min_count: 1
  field :action_body, if: [is_local], min_count: 1
  field :external_iri, if: [is_remote], min_count: 1
  field :reward, input_field: MoneyInput
  has_one :default_cover_photo
  has_one :custom_placement

  group :advanced, label: -> { I18n.t('forms.advanced') } do
    field :pinned
    field :expires_at
  end

  footer do
    actor_selector
  end

  hidden do
    field :is_draft
  end
end
