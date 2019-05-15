class ApplicationController < ActionController::Base
  before_filter :configure_permitted_paramaters, if: :devise_controller?

  def configure_permitted_paramaters
    devise_paramater_sanitizer.permit(:sign_up, keys: [:name])
    devise_paramater_sanitizer.permit(:account_update, keys: [:name])
  end
end
