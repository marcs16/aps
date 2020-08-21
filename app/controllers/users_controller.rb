class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :reset_password]
  before_action :authenticate_user!
   
   
	
  def index
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params,{view_context: view_context,edit: edit_user_path('_'),current_user: current_user}) }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_index_path, notice: 'Datos de usuario actualizados con exito.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def reset_password
    @user.password = '123456'
    @user.save
    
    respond_to do |format|
      format.html { redirect_to users_index_path, notice: 'Contraseña reseteada con exito.'}
      format.json { head :no_content }
    end
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:full_name,:email,:type_of_id,:number_of_id,:position,:date_of_birth,:working_since,:telephone) 
    end
end
