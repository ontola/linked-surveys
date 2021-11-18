# frozen_string_literal: true

class SurveyMenuList < ApplicationMenuList
  has_menu(
    :actions,
    image: 'fa-ellipsis-v',
    menus: -> { action_menu_items }
  )
  has_menu :settings, menus: -> { settings_menu_items }

  private

  def action_menu_items
    [
      edit_menu_item(resource),
      delete_menu_item(resource),
      copy_menu_item(resource.iri),
    ]
  end

  def settings_menu_items # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    [
      menu_item(:form, href: resource.custom_form.collection_iri(:custom_form_fields), image: 'fa-edit')
    ]
  end
end
