class Api::V1::MedalistsController < ApplicationController

  def index
    event = Event.find(params[:event_id])
    render json: MedalistSerializer.new(Olympians.all_medalists(event.id))
  end
end
