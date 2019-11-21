class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(user_id: current_user.id)
  end


  def participating
    @event_users = EventUser.where(user_id: current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event_item = EventItem.new
    @event_items = Event.new.select_item_by_events(params[:id])

    @items = Item.where(user_id: current_user.id)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    if @event.save
      Event.new.event_create
      flash[:success] =  "Evento criado!"
      redirect_to root_path
    else
      flash[:error] =  @event.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
    Event.new.delete_event(params[:id])
    @event.destroy
    flash[:error] = "Evento removido"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :user_id,:data_event)
    end
end
