# frozen_string_literal: true

class CustomFormFieldMenuList < ApplicationMenuList
  has_menu(
    :actions, {
      image: 'fa-ellipsis-v',
      menus: -> { actions_menu_items }
    }
  )

  def actions_menu_items
    [
      edit_link,
      copy_share_link(resource.iri)
    ]
  end
end
