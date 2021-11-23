class AuthorizedController < ApplicationController
  before_action :check_if_registered, if: :check_if_registered?

  private

  def check_if_registered
    return unless current_user.guest?

    raise LinkedRails::Auth::Errors::Unauthorized.new
  end

  def check_if_registered?
    UNSAFE_METHODS.include?(request.method)
  end
end
