# frozen_string_literal: true

class SubmissionsController < AuthorizedController
  active_response :show, :index

  has_collection_create_action
  has_resource_update_action
  has_resource_destroy_action
  has_resource_action(
    :submit,
    **update_resource_options(
      action_name: :submit_action,
      action_path: :submit,
      form: -> { resource.parent.custom_form&.iri },
      target_query: {'submission[status]' => :submission_finished}
    )
  )

  private

  def allow_empty_params?
    true
  end

  def check_if_registered?
    false
  end

  def create_success
    add_exec_action_header(response.headers, ontola_dialog_action(current_resource.iri, opener: parent_resource.iri))

    super
  end

  def create_success_location
    parent_resource.iri.to_s
  end

  def create_success_message; end

  def permit_params
    super.merge(body_graph: params[:body_graph])
  end

  def update_meta
    super + [
      invalidate_resource_delta(current_resource),
      invalidate_resource_delta(current_resource.action(:submit)),
      invalidate_resource_delta(parent_resource.menu(:settings))
    ]
  end

  def update_success_message; end

  def update_success_location
    parent_resource.iri.to_s
  end
end
