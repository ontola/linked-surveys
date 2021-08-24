# frozen_string_literal: true

class CustomFormSerializer < EdgeSerializer
  with_collection :custom_form_fields, predicate: NS.argu[:customFormFields]
  attribute :fields_iri, predicate: NS.form[:pages]
end
