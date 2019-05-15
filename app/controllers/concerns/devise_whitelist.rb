module DeviseWhitelist
  extend ActiveSupport::Concern

  # Changed to before_action. before_filter has been deprecated
  included do
    before_action :configure_permitted_paramaters, if: :devise_controller?
  end

  def configure_permitted_paramaters
    devise_paramater_sanitizer.permit(:sign_up, keys: [:name])
    devise_paramater_sanitizer.permit(:account_update, keys: [:name])
  end

end
