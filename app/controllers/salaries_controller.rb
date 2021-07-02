class SalariesController < ApplicationController
  before_action :set_salary, only: [:show, :edit, :update, :destroy]
  before_action :set_user_name, only: [:show, :edit]
  before_action :authenticate_user!
  load_and_authorize_resource


  # GET /salaries
  # GET /salaries.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: SalaryDatatable.new(params,{edit: edit_salary_path('_'),show: salary_path('_'),current_user: current_user}) }
    end
  end

  # GET /salaries/1
  # GET /salaries/1.json
  def show
  end

  # GET /salaries/new
  def new
    @users = User.all
    @salary = Salary.new

  end

  # GET /salaries/1/edit
  def edit
  end

  # POST /salaries
  # POST /salaries.json
  def create
    @salary = Salary.new(salary_params)

    respond_to do |format|
      if @salary.save
        format.html { redirect_to @salary, success: t('app_common.models.salaries.actions.created') }
        format.json { render :show, status: :created, location: @salary }
      else
        format.html { render :new }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salaries/1
  # PATCH/PUT /salaries/1.json
  def update
    respond_to do |format|
      if @salary.update(salary_params)
        format.html { redirect_to @salary, info: t('app_common.models.salaries.actions.updated')  }
        format.json { render :show, status: :ok, location: @salary }
      else
        format.html { render :edit }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salaries/1
  # DELETE /salaries/1.json
  def destroy
    @salary.destroy
    respond_to do |format|
      format.html { redirect_to salaries_url, danger: 'Salary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def try_salary
    user = Salary.where.not(social_benefits: nil, user_id: 2 ).first


    render json: user , status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_name
      @user_full_name = @salary.user.full_name
    end
    def set_salary
      @salary = Salary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salary_params
      params.require(:salary).permit(:type_of_salary,:social_benefits, :basic_month, :basic_day, :basic_hour, :average_payment, :last_basic, :last_increase_date, :bank, :bank_number,:way_to_pay, :user_id,:type_of_bank_account )
    end

end
