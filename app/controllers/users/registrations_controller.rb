# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @user_detail = @user.build_user_detail
    render :new_user_detail
  end

  def create_user_detail
    @user = User.new(session['devise.regist_data']['user'])

    @user_detail = UserDetail.new(user_detail_params)
    render :new_user_detail and return unless @user_detail.valid?

    @user.build_user_detail(@user_detail.attributes)
    @user.save
    session['devise.regist_data']['user'].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  # def edit
  #   super
  # end

  # def update

  # end

  private

  def user_detail_params
    params.require(:user_detail).permit(:introduce, :GitHub, :age_id, :prefecture_id, :language_id, :type_id, :goal_id)
  end

  # GET /resource/edit

  # PUT /resource

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
