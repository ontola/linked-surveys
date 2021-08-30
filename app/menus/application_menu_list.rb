# frozen_string_literal: true

class ApplicationMenuList < LinkedRails::Menus::List
  include LinkedRails::Helpers::OntolaActionsHelper

  def edit_link
    iri = resource.iri.dup
    iri.path += '/edit'

    menu_item(
      :edit,
      action: ontola_dialog_action(iri),
      image: 'fa-edit',
      href: iri,
      policy: :update?
    )
  end

  def copy_share_link(url)
    menu_item(
      :copy,
      action: ontola_copy_action(url),
      item_type: 'copy',
      image: 'fa-clipboard',
      href: url
    )
  end
end
