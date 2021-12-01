# frozen_string_literal: true

class CustomFormFieldSerializer < ApplicationSerializer
  attribute :title, predicate: Vocab.schema.name
  attribute :description, predicate: Vocab.schema.text
  attribute :helper_text, predicate: Vocab.ontola[:helperText]
  attribute :default_value, predicate: Vocab.form[:defaultValue]
  attribute :max_count, predicate: Vocab.sh.maxCount
  attribute :min_count, predicate: Vocab.sh.minCount
  attribute :max_inclusive, predicate: Vocab.sh.maxInclusive
  attribute :min_inclusive, predicate: Vocab.sh.minInclusive
  attribute :max_length, predicate: Vocab.sh.maxLength
  attribute :min_length, predicate: Vocab.sh.minLength
  attribute :pattern, predicate: Vocab.sh.pattern
  attribute :sh_in, predicate: Vocab.sh.in
  attribute :predicate, predicate: Vocab.argu[:predicate]
  attribute :sh_path, predicate: Vocab.sh.path

  enum :form_field_type, predicate: Vocab.argu[:formFieldType]

  with_collection :field_options, predicate: Vocab.app[:fieldOptions]
end
