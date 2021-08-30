# frozen_string_literal: true

class CustomFormSerializer < ApplicationSerializer
    attribute :title, predicate: Vocab.schema.name

    with_collection :custom_form_fields, predicate: Vocab.argu[:customFormFields]
end

