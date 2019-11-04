class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json:
    {"data" => {"attributes" => {"olympian_stats" => {
      "total_competing_olympians" => Athlete.total_competing_olympians,
      "average_weight:" => {
        "unit" => "kg",
        "male_olympians" => Athlete.average_weight("M"),
        "female_olympians" => Athlete.average_weight("F")
      },
      "average_age:" => Athlete.average_age }
        }
      }
    }
  end  
end
