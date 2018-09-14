class EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /admin/events
  # GET /admin/events.json
  def index
    puts '==========================>'
    puts custom_current_user.inspect
    puts '==========================>'
    @events = Event.includes([:category, :country])
                  .select("title, startdate, enddate, description,countries.name as country, categories.name as category")
                  .references(:categories, :countries)
  end
  def get_dataset
    #render :json => @programs, :include => {:insurer => {:only => :name}}, :except => [:created_at, :updated_at]
    @event = Event.select("id,title, startdate, enddate, description, categories_id, country_id, state")
    render json: {
                  data: @event.as_json(include: {:category => {only: :name}, :country => {only: [:name, :code_iso]}} )
                }
  end
  # GET /admin/events/1
  # GET /admin/events/1.json
  def show
  end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # GET /admin/events/1/edit
  def edit
  end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @event = Event.new(admin_event_params)
    puts '=========='
    puts params.inspect
    puts '=========='
    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/events/1
  # PATCH/PUT /admin/events/1.json
  def update
    respond_to do |format|
      if @event.update(admin_event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def event_js
    @event = Event.find params[:id]
    render json: @event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_event_params
      params.require(:event).permit(:title, :startdate, :enddate, :description, :drive_link, :state, :categories_id, :country_id)
    end
end
