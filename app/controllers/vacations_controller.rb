class VacationsController < ApplicationController
  before_action :set_vacation,  only: [:show, :edit, :update, :destroy]
  before_action :set_user_name, only: [:show, :edit]
  before_action :set_users,     only: [:new, :edit]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /vacations
  # GET /vacations.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: VacationDatatable.new(params,{edit: edit_vacation_path('_'),show: vacation_path('_'),current_user: current_user}) }
    end
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
  end

  # GET /vacations/new
  def new
    @vacation = Vacation.new
  end

  # GET /vacations/1/edit
  def edit
    @employe = @vacation.user_id

  end

  # POST /vacations
  # POST /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)

    respond_to do |format|
      if @vacation.save
        format.html { redirect_to @vacation, success: t('app_common.models.vacations.actions.created') }
        format.json { render :show, status: :created, location: @vacation }
      else
        format.html { render :new }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacations/1
  # PATCH/PUT /vacations/1.json
  def update
    respond_to do |format|
      format.html { redirect_to @vacation, info: t('app_common.models.vacations.actions.updated') }
      if @vacation.update(vacation_params)
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation.destroy
    respond_to do |format|
      format.html { redirect_to vacations_url, danger: 'Vacation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_name
      @user_full_name = @vacation.user.full_name
    end
    def set_users
      @users = User.where(can_login: 'si')
    end
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacation_params
      params.require(:vacation).permit(:laborated_period, :end_of_laborated_period, :period_until_deductions, :business_days, :holidays, :entry_day, :exit_day, :last_vacations, :acumulated_periods, :suspension_days, :date_until_suspension, :cost_center, :status, :observations, :files, :user_id)
    end
end
