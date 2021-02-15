class MaintaincesController < ApplicationController
  before_action :set_maintaince, only: [:show, :edit, :update, :destroy]
  before_action :set_device
  before_action :authenticate_user!
  # GET /maintainces
  # GET /maintainces.json
  def index
    respond_to do |format|
    format.html
    format.json { render json: MaintainceDatatable.new(params,{view_context: view_context,device: @device, current_user: current_user}) }
    end
  end

  # GET /maintainces/1
  # GET /maintainces/1.json
  def show
  end

  # GET /maintainces/new
  def new
    @maintaince = @device.maintainces.build

  end

  # GET /maintainces/1/edit
  def edit
  end

  # POST /maintainces
  # POST /maintainces.json
  def create
    @maintaince = current_user.maintainces.new(maintaince_params)
    @maintaince.device = @device
    respond_to do |format|
      if @maintaince.save
        format.html { redirect_to @maintaince.device, success: t('app_common.models.maintainces.actions.created') }
        format.json { render :show, status: :created, location: @maintaince }
      else
        format.html { render :new }
        format.json { render json: @maintaince.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintainces/1
  # PATCH/PUT /maintainces/1.json
  def update
    respond_to do |format|
      if @maintaince.update(maintaince_params)
        format.html { redirect_to device_maintaince_path(@maintaince.device.id,@maintaince), info: t('app_common.models.maintainces.actions.created') }
        format.json { render :show, status: :ok, location: @maintaince }
      else
        format.html { render :edit }
        format.json { render json: @maintaince.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintainces/1
  # DELETE /maintainces/1.json
  def destroy
    @maintaince.destroy
    respond_to do |format|
      format.html { redirect_to device_maintainces_url(@device), danger: 'Maintaince was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def export_maintainces()
    @maintainces = User.joins(:devices, :maintainces).select('users.full_name as done_by,devices.name as device ,
      maintainces.name, maintainces.description, maintainces.date').where(devices:{user_id: @device.user_id})
     render xlsx: 'Reporte mantenimientos '+ Time.now.to_s,
        template: 'reports/export_maintainces.xlsx.axlsx'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:device_id])
    end
    def set_maintaince
      @maintaince = Maintaince.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintaince_params
      params.require(:maintaince).permit(:name, :description, :date)
    end
end
