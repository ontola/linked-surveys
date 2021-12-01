Rails.application.routes.draw do
  use_linked_rails_auth
  use_linked_rails
  find_tenant_route
  use_doorkeeper
  devise_for :users

  root to: 'home_pages#show'
  resource :home_page, only: :show, path: :home

  linked_resource(Coupon)
  linked_resource(CouponBatch)
  linked_resource(CustomForm)
  linked_resource(CustomFormField)
  linked_resource(FieldOption)
  linked_resource(Submission)
  linked_resource(SubmissionValue)
  linked_resource(Survey)
end
