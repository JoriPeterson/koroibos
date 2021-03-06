class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json:
    {"data" => {"attributes" => {"olympian_stats" => {
      "total_competing_olympians" => Olympian.total_competing_olympians,
      "average_weight:" => {
        "unit" => "kg",
        "male_olympians" => Olympian.average_weight("M"),
        "female_olympians" => Olympian.average_weight("F")
      },
      "average_age:" => Olympian.average_age }
        }
      }
    }
  end
end
