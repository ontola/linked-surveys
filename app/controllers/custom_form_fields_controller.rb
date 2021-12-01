# frozen_string_literal: true

class CustomFormFieldsController < AuthorizedController
  active_response :show, :index

  has_collection_create_action
  has_resource_update_action
  has_resource_destroy_action

  def update_success_location
    current_resource.parent.surveys.first || super
  end
end
