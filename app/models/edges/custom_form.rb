# frozen_string_literal: true

class CustomForm < Edge
  enhance LinkedRails::Enhancements::Menuable
  enhance LinkedRails::Enhancements::Creatable
  enhance LinkedRails::Enhancements::Updatable
  enhance Trashable

  property :display_name, :string, NS.schema.name
  parentable :page
  validates :display_name, presence: true

  with_collection :custom_form_fields

  def fields_iri
    custom_form_field_collection.default_view.members_iri
  end
end
