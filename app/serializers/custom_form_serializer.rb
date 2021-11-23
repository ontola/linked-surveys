# frozen_string_literal: true

class CustomFormSerializer < ApplicationSerializer
  attribute :title, predicate: Vocab.schema.name

  with_collection :custom_form_fields, predicate: Vocab.argu[:customFormFields]

  statements :field_statements

  def self.field_statements(object, _params) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    pages_iri = RDF::URI("#{object.iri}#pages")
    page_iri = RDF::URI("#{object.iri}#page")
    groups_iri = RDF::URI("#{object.iri}#groups")
    group_iri = RDF::URI("#{object.iri}#group")

    [
      [object.iri, Vocab.form[:pages], page_iri],
      [page_iri, Vocab.rdfv.type, RDF.Seq],
      [page_iri, RDF[:_0], pages_iri],
      [pages_iri, Vocab.rdfv.type, Vocab.form[:Page]],
      [pages_iri, Vocab.form[:groups], groups_iri],
      [groups_iri, Vocab.rdfv.type, RDF.Seq],
      [groups_iri, RDF[:_0], group_iri],
      [group_iri, Vocab.rdfv.type, Vocab.form[:Group]],
      [group_iri, Vocab.form[:fields], object.fields_iri]
    ]
  end
end
