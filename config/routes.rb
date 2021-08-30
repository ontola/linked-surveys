Rails.application.routes.draw do
  use_linked_rails_auth
  use_linked_rails
  find_tenant_route
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  linked_resource(CustomForm)
  linked_resource(CustomFormField)
  linked_resource(Submission)
  linked_resource(SubmissionValue)
  linked_resource(Survey)
  root 'custom_forms#index'
end
