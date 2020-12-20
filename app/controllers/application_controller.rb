class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, only: [:update], if: :devise_controller?
  
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduce,:image,:GitHub,:age_id,:prefecture_id,:language_id,:type_id,:goal_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :introduce,:image,:GitHub,:age_id,:prefecture_id,:language_id,:type_id,:goal_id,:image])
  end

end
