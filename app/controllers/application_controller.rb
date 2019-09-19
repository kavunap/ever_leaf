class ApplicationController < ActionController::Base
    #helper_method :current_user
    # around_action :switch_locale
 
    # def switch_locale(&action)
    #   locale = params[:locale] || I18n.default_locale
    #   I18n.with_locale(locale, &action)
    # end
#   before_action :set_locale

#   def set_locale
#     I18n.locale = params[:locale] || I18n.default_locale
#   end

#   def default_url_options
#     { locale: I18n.locale }
#   end
    # private

    #     def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #     end

    #     def authenticate_user!
    #         redirect_to :root if current_user.nil?
    #     end
    # end
end
