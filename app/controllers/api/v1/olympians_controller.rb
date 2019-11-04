class Api::V1::OlympiansController < ApplicationController

  def index
    if params[:age] == "youngest"
      render json: AthleteSerializer.new(Athlete.youngest_olympian)
    elsif params[:age] == "oldest"
      render json: AthleteSerializer.new(Athlete.oldest_olympian)
    else
      render json: AthleteSerializer.new(Athlete.all)
    end
  end
end
