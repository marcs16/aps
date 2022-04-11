class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :get_browser_language
	before_action :configure_permitted_parameters, if: :devise_controller?
	add_flash_types :success, :danger, :info

	rescue_from CanCan::AccessDenied do |exception|
	denied = t('app_common.notification.no_access')
	respond_to do |format|
		format.html { redirect_to root_path, :danger => denied }
		format.json { render json: denied.to_json, status: 403 }
	end
end

	def get_browser_language
		begin
			unless session[:selected_language].present?
				# Select Languages created in the system
				languages = Language.select(:abbreviation)
				# Get Language browser client
				language_browser = request.env['HTTP_ACCEPT_LANGUAGE'].split(',')[0].split(';')[0].sub('-', '_')

				if languages.exists?(:abbreviation => language_browser)
					session[:selected_language] = language_browser
				else
					session[:selected_language] = I18n.default_locale
				end
			end
		rescue Exception => e
			session[:selected_language] = I18n.default_locale
		end

		I18n.locale = session[:selected_language]

	end

 	protected
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone])
  	end
  	def current_language
      @current_language = session[:selected_language]
    end
end
