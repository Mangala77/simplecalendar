class EventsController < ApplicationController
   respond_to :json
  def index
    @events = Event.all  
    respond_to do |format|  
      format.html # index.html.erb  
      format.json { render :json => @events }  
    end 
    
  end
  
  def new
    @event = Event.new
    respond_to do |format|  
      format.html  
      format.json { render :json => @event }  
    end 
  end
  
  def show
    @event = Event.find(params[:id])
    
  end
  
  def create
    @event = Event.new(events_params)
    respond_to do |format|
      if @event.save  
        format.json { render :json => @event } 
      else
        #format.html{redirect_to events_path}
      end
    end 
  end
  
  
  private

  def events_params
    params.require(:event).permit(:name, :start_time, :end_time, :description)
  end
end
