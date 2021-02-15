# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: []
  prepend_before_action :authenticate_scope!, only: [:new, :create, :edit, :update, :destroy, :cancel]

  # GET /resource/sign_up
  def new
    #authorize! :new, User
    super
  end

  # POST /resource
  def create
    #authorize! :create, User
    @user = User.new(sign_up_params)
    if @user.password = ""
      @user.password  = "1234567"
    elsif @user.password_confirmation =""
      @user.password_confirmation = @user.password
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_index_path, success: t('app_common.models.users.actions.created') }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  protected


  def sign_up_params
    params.require(:user).permit(:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone,:current_password,:password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone,:current_password, :password, :password_confirmation)
  end
  #before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone])
  #end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
   #  devise_parameter_sanitizer.permit(:account_update, keys: [:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone])
  #end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
