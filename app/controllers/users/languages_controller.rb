# frozen_string_literal: true

module Users
  class LanguagesController < AuthorizedController
    active_response :update

    private

    def interact_as_guest?
      true
    end

    def locale_param
      (params.permit(:locale)[:locale] || params.require(:user).require(:language)).to_sym
    end

    def new_oauth_token
      generate_access_token(current_user)
    end

    def requested_resource
      @requested_resource ||= current_user
    end

    def update_execute
      return false unless valid_locale?

      I18n.locale = locale_param
      current_user.language = locale_param
      return false unless current_user.guest? || current_user.save

      update_oauth_token(new_oauth_token)
    end

    def update_failure
      respond_with_redirect(location: request.headers['Referer'] || root_path, notice: I18n.t('errors.general'))
    end

    def update_success
      respond_with_redirect(location: request.headers['Referer'] || root_path)
    end

    def valid_locale?
      return true if I18n.available_locales.include?(locale_param)

      Bugsnag.notify(RuntimeError.new("Invalid locale #{locale_param}"))
      false
    end

    class << self
      def controller_class
        User
      end
    end
  end
end
