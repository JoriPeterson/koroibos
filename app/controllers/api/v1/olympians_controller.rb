class Api::V1::OlympiansController < ApplicationController

  def index
    if params[:age] == "youngest"
      render json: OlympianSerializer.new(Olympian.youngest_olympian)
    elsif params[:age] == "oldest"
      render json: OlympianSerializer.new(Olympian.oldest_olympian)
    else
      render json: OlympianSerializer.new(Olympian.all)
    end
  end
end
