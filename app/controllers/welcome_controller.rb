 class WelcomeController < ApplicationController
  def index
  	redirect_to new_user_session_path

  end
  def indexlog
  	if current_user.can_login != 'si'
      respond_to do |format|
        format.html{redirect_to welcome_logout_disable_path}
      end
  	else
      respond_to do |format|
        format.html {redirect_to edit_user_registration_path, success: "Has iniciado sesión exitosamente."}
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
