class Api::V1::OlympiansController < ApplicationController

  def index
    render json: AthleteSerializer.new(Athlete.all)
  end
end
