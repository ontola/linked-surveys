# frozen_string_literal: true

class CustomFormField < ApplicationRecord
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable

  belongs_to :custom_form
  alias parent custom_form

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
    fileInput: 9,
    locationInput: 10,
    moneyInput: 11,
    multipleEmailInput: 12,
    numberInput: 13,
    passwordInput: 14,
    radioGroup: 15,
    sliderInput: 16,
    toggleButtonGroup: 17
  }

  def rdf_type
    Vocab.form[form_field_type.to_s.classify]
  end

  def sh_path
    predicate || iri
  end

  class << self
    private

    def attributes_for_new(opts)
      super.merge(
        custom_form: opts[:parent]
      )
    end
  end
end
