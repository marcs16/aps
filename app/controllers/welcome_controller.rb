class WelcomeController < ApplicationController
  def index
  	redirect_to new_user_session_path
  end
  def indexlog
  	redirect_to edit_user_registration_path
  end

end
