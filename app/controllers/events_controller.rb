class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :usr_names, only: [:new,:create,:show, :update]
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /events
  # GET /events.json
  def index
    @event = Hash.new
    @events= Event.where("members  ILIKE ANY ( array[?] )", "%#{current_user.full_name}%")
    @evs = Event.all.select(:id,:members)
    #@evs.each do |membs|
    #  @event[membs.id] = JSON.parse(membs[:members])
    #  if @event[membs.id].include? current_user.full_name
    #    @events = Event.where(id: membs.id)
    #  end
    #end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @current_event = JSON.parse(@event.members)
    #@eve = @current_event.reject(&:empty?).join(", ")

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @users = User.select("full_name")

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    respond_to do |format|
      if @event.save
        @current_event = JSON.parse(@event.members)
        # notify_event(@current_event, @event.title, @event.start_date,@event.end_date)
        notify_per_person(@current_event, @event.title, @event.id)
        format.html { redirect_to @event, success: t('app_common.models.events.actions.created') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @current_event = JSON.parse(@event.members)
        # notify_event(@current_event, @event.title, @event.start_date,@event.end_date)
        notify_per_person(@current_event, @event.title, @event.id)
        format.html { redirect_to @event, info: t('app_common.models.events.actions.updated') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, danger: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date,  :user_id,:members =>[])
    end

    def notify_event(people, event, start_date, end_date)
      people_to_notify= people.reject(&:empty?)
      @telephones =[]
      people_to_notify.each do |name|
        @person =  User.select(:telephone).telephoned(name)
        @telephones.push(@person)
          @telephones.each do |v,k|
            @message = "#{name}, se te ha invitado a la reunión #{event}, empieza a las #{start_date} y termina a las #{end_date}"
            SendSMS.new(@message,v.telephone).call
          end
      end
    end
    def notify_per_person(people, message, event)
      people_to_notify= people.reject(&:empty?)
      @people = []
      @people_ids = []
      @person = ''
      @notification = Notification.new
      people_to_notify.each do |name|
        person = User.select(:id).where(full_name: name)
        @people.push(person)
      end
      @people.each do |v, k|
        @people_ids.push(v.id)
      end
        @notification.message = message
        @notification.notification_origin = "event"
        @notification.origin_id = event
        @notification.user_id = @people_ids
        @notification.save
    end

    def usr_names
      @users = User.select("full_name")
    end

end
