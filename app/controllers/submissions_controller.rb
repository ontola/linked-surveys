# frozen_string_literal: true

class SubmissionsController < ApplicationController
    active_response :show, :index

    private

    def allow_empty_params?
        true
    end

    def create_success
        add_exec_action_header(response.headers, ontola_dialog_action(current_resource.iri, opener: parent_resource.iri))

        super
    end

    def create_success_location
        parent_resource.iri.to_s
    end

    def create_success_message; end

    # def permit_params
    #     super.merge(body_graph: params[:body_graph])
    # end

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
