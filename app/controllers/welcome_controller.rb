 class WelcomeController < ApplicationController
  def index
    if @current_user = nil
      redirect_to new_user_session_path
    else
      redirect_to users_index_path
    end
  end

  def indexlog
  	if current_user.can_login != 'si'
      respond_to do |format|
        format.html{redirect_to welcome_logout_disable_path}
      end
  	else
      respond_to do |format|
        message = 'Hola ' + @current_user.full_name + ', has iniciado sesión'
        telephone = @current_user.telephone
        SendSMS.new(message,telephone).call
        format.html {redirect_to edit_user_registration_path, success: t('devise.sessions.new.signed_in')}
      end

  	end
  end
  def logout_disable
    respond_to do |format|
      format.html { render :logout_disable, info: "imposible loguearse"}
      format.json { head :no_content  }
    end
  end

end
