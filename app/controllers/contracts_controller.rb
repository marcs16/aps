class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  before_action :set_users
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
    respond_to do |format|
    format.html
    format.json { render json: ContractDatatable.new(params,{view_context: view_context,edit: edit_contract_path('_'),show: contract_path('_'), current_user: current_user}) }
  end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    rate = calculate_percentaje(@contract.executed_value, @contract.value)
    @contract.execution_rate = rate
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
    rate = calculate_percentaje(@contract.executed_value, @contract.value)
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)
    rate = calculate_percentaje(@contract.executed_value, @contract.value)
    @contract.execution_rate = rate
    respond_to do |format|
      if @contract.save

        format.html { redirect_to @contract, success: t('app_common.models.contracts.actions.created') }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      rate = calculate_percentaje(@contract.executed_value, @contract.value)
      @contract.execution_rate = rate
      if @contract.update(contract_params)
        format.html { redirect_to @contract, info:  t('app_common.models.contracts.actions.updated') }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_path, danger: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  protected

  def calculate_percentaje(execution_value, whole_value)
    percentaje = execution_value.delete('.').to_f*100
    percentaje = percentaje/whole_value.delete('.').to_f
    return percentaje
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    def set_users
        @users = User.where(can_login: "si").select("full_name")
    end

    # to reciube an  imported file
    def import_file(file)
      Archive.import(file)
    end

    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:code, :contractor, :object, :initiation_act, :dead_line, :lit_value, :value, :executed_value, :execution_rate, :observations, :status, :supervisor)
    end
end
