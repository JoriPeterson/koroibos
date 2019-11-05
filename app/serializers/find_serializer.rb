class FindSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :team, :age, :sport, :total_medals_won, :weight, :sex, :medal
end
