class Api::V1::Olympians::FindController < ApplicationController

  def index
    olympians = Olympian.where(olympian_params)
    if !olympians.empty?
      render json: FindSerializer.new(olympians)
    else
      render json: { error: "Attribute does not exist" }, status: 400
    end
  end

  def show
    olympian = Olympian.find_by(olympian_params)
    if !olympian.nil?
      render json: FindSerializer.new(Olympian.find_by(olympian_params))
    else
      render json: { error: "Attribute does not exist" }, status: 400
    end
  end

  private

  def olympian_params
    params.permit(:id, :name, :team, :age, :sport, :total_medals_won, :medals, :weight, :sex)
  end
end
