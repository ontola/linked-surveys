# frozen_string_literal: true

class CustomFormFieldSerializer < ApplicationSerializer
   attribute :title, predicate: Vocab.schema.name
   attribute :description, predicate: Vocab.schema.text
   attribute :helper_text, predicate: Vocab.ontola[:helperText]
   attribute :default_value, predicate: Vocab.form[:defaultValue]
   attribute :max_count, predicate: Vocab.sh.maxCount
   attribute :max_count_prop, predicate: Vocab.ontola[:maxCount]
   attribute :min_count, predicate: Vocab.sh.minCount
   attribute :min_count_prop, predicate: Vocab.ontola[:minCount]
   attribute :max_inclusive, predicate: Vocab.sh.maxInclusive
   attribute :max_inclusive_prop, predicate: Vocab.ontola[:maxInclusive]
   attribute :min_inclusive, predicate: Vocab.sh.minInclusive
   attribute :min_inclusive_prop, predicate: Vocab.ontola[:minInclusive]
   attribute :max_length, predicate: Vocab.sh.maxLength
   attribute :max_length_prop, predicate: Vocab.ontola[:maxLength]
   attribute :min_length, predicate: Vocab.sh.minLength
   attribute :min_length_prop, predicate: Vocab.ontola[:minLength]
   attribute :pattern, predicate: Vocab.sh.pattern
   attribute :sh_in, predicate: Vocab.sh.in
   attribute :sh_in_prop, predicate: Vocab.ontola[:shIn]
   attribute :predicate, predicate: Vocab.argu[:predicate]
   attribute :sh_path, predicate: Vocab.sh.path

   enum :form_field_type, predicate: Vocab.argu[:formFieldType]
end
