# frozen_string_literal: true

class CustomFormField < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  OPTION_TYPES = %i[checkboxGroup radioGroup selectInput toggleButtonGroup].freeze

  belongs_to :custom_form
  alias parent custom_form
  has_many :field_options
  with_collection :field_options

  acts_as_list column: :order, scope: :custom_form

  accepts_nested_attributes_for :field_options, allow_destroy: true, reject_if: :all_blank

  enum form_field_type: {
    selectInput: 0,
    textInput: 1,
    dateInput: 2,
    checkboxGroup: 3,
    textAreaInput: 4,
    checkboxInput: 5,
    colorInput: 6,
    dateTimeInput: 7,
    emailInput: 8,
    moneyInput: 11,
    multipleEmailInput: 12,
    numberInput: 13,
    passwordInput: 14,
    radioGroup: 15,
    sliderInput: 16,
    toggleButtonGroup: 17
  }

  def pattern
    return RFC822::EMAIL.source if emailInput? || multipleEmailInput?

    super
  end

  def rdf_type
    return super unless form_field_type

    Vocab.form[form_field_type.to_s.classify]
  end

  def sh_in
    collection_iri(:field_options) if OPTION_TYPES.include?(form_field_type&.to_sym)
  end

  def sh_path
    predicate || iri
  end

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        max_count: 1,
        custom_form: opts[:parent]
      )
    end
  end
end
