class NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notifications.new(notification_params)
    respond_to do |format|
      if @notification.save
        #format.html { redirect_to @notification, success: t('app_common.models.notifications.actions.created') }
        #format.json { render :show, status: :created, location: @notification }
      else
        #format.html { render :new }
      #  format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:message, :notification_origin, :origin_id, :user_id =>[])
    end

end
