# frozen_string_literal: true

class SurveyMenuList < ApplicationMenuList
  has_menu(
    :actions, {
      image: 'fa-ellipsis-v',
      menus: -> { actions_menu_items }
    }
  )
  has_menu :settings,
           menus: -> { settings_menu_items }

  private

  def actions_menu_items
    [
      edit_link,
      copy_share_link(resource.iri)
    ]
  end

  def settings_menu_items
    [
      submission_menu_item,
      submissions_menu_item,
      menu_item(
        :form,
        href: resource.custom_form.iri,
        image: 'fa-edit'
      ),
    ]
  end

  def submission_menu_item
    submission = nil # resource.submission_for(user_context)

    if submission
      menu_item(:submission, href: submission.iri)
    else
      menu_item(:participate, href: resource.submission_collection.action(:create).iri)
    end
  end

  def submissions_menu_item
    iri = resource.iri.dup
    iri.path += '/submissions?display=table'

    menu_item(
      :submissions,
      label: 'Submissions',
      href: iri
    )
  end
end
