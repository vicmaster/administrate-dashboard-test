# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    before_action :set_locale

    def authenticate_admin
      redirect_to '/', alert: 'Not authorized.' unless current_user && access?
    end

    private

    def access?
      current_user.has_role? :admin
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
