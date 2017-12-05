class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    if current_user.has_role? :profesor
      @event = Event.new
    end
  end

  def edit
  end

  def create
    if current_user.has_role? :profesor
      @event = Event.new(event_params)
      @event.save
    end
  end

  def update
    if current_user.has_role? :profesor
      @event.update(event_params)
    end
  end

  def destroy
    if current_user.has_role? :profesor
    @event.destroy
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
