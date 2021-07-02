 class WelcomeController < ApplicationController
  def index
      redirect_to new_user_session_path
  end

  def indexlog
      respond_to do |format|
        @current_user = current_user
        message = 'Hola ' + @current_user.full_name + ', has iniciado sesión'
        telephone = @current_user.telephone
        #SendSMS.new(message,telephone).call
        format.html {redirect_to edit_user_registration_path}
      end

  	end

end
