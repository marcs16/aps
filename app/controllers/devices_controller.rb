class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /devices
  # GET /devices.json
  def index

  respond_to do |format|
    format.html
    format.json { render json: DeviceDatatable.new(params,{edit: edit_device_path('_'),show: device_path('_'),current_user: current_user}) }
  end
end
  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = current_user.devices.new(device_params)
    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, success: t('app_common.models.devices.actions.created') }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, info: t('app_common.models.devies.actions.updated') }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, danger: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report_devices
    @devices = User.joins(:devices).select('users.full_name, devices.name,
    devices.type_of_device, devices.number, devices.operative_system,
    devices.processor, devices.memory, devices.mac')
    #La variable @personal contiene a la lista del personal de una empresa x.
    render xlsx: 'Reporte de dispositivos existentes '+ Time.now.to_s,
        template: 'reports/export_devices.xlsx.axlsx'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def device_params
      params.require(:device).permit(:name, :type_of_device, :number, :operative_system, :processor, :memory, :mac)
    end
end
