# frozen_string_literal: true

class HomePage < LinkedRails::WebSite
  class << self
    def homepage
      LinkedRails::WebPage.new(
        name: 'Linked Surveys',
        includes: homepage_includes,
        iri: LinkedRails.iri(path: 'home'),
        widgets: homepage_widgets
      )
    end

    def homepage_includes
      homepage_widgets
    end

    def homepage_widgets
      [
        LinkedRails::Widget.new(
          size: 3,
          resources: [LinkedRails.iri(path: '/surveys')]
        )
      ]
    end

    def requested_resource(opts, user_context)
      LinkedRails::WebSite.new(
        homepage: homepage,
        image: RDF::URI('http://fontawesome.io/icon/home'),
        iri: LinkedRails.iri,
        name: 'Linked Surveys',
        navigations_menu: AppMenuList.new(resource: user_context).menu(:navigations).iri
      )
    end
  end
end
