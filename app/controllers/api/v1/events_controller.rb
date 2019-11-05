class Api::V1::EventsController < ApplicationController

  def index
    render json: EventSerializer.new(Sport.all)
  end
end
