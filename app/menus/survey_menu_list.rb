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

  def settings_menu_items
    [
      submission_item,
      menu_item(
        :form,
        href: resource.custom_form.collection_iri(:custom_form_fields),
        image: 'fa-edit',
        policy: :update?
      ),
      menu_item(
        :submissions,
        href: resource.collection_iri(:submissions),
        image: 'fa-list-ul',
        policy: :update?
      ),
      menu_item(
        :coupon_batches,
        href: resource.collection_iri(:coupon_batches),
        image: 'fa-key',
        policy: :update?
      )
    ]
  end

  def submission_item
    submission = resource.submission_for(user_context)

    if submission
      menu_item(:submission, href: submission.iri, image: 'fa-pencil')
    else
      menu_item(:participate, href: resource.submission_collection.action(:create).iri, image: 'fa-pencil')
    end
  end
end
