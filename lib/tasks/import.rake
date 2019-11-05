require 'csv'

task import: :environment do

  sports = {}
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    sports[row['sport']] =
      {
        sport: row['sport']
      }
    end
  Sport.import(sports.values)


  sports_hash = Sport.pluck(:sport, :id).to_h
  events = {}
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    sport_id = sports_hash[row['sport']]
    events[row['event']] = {
      sport_id: sport_id,
      event: row['event'],
      medal: row['medal']
    }
  end
  Event.import(events.values)


  olympians = {}
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    if !olympians.include?(row["name"])
      olympians[row['name']] =
      {
        name: row["name"],
        team: row["team"],
        age: row["age"],
        sport: row["sport"],
        total_medals_won: 0,
        weight: row["weight"],
        sex: row["sex"],
        medal: row["medal"],
      }
    end

    if row["medal"] != "NA"
      olympians[row["name"]][:total_medals_won] += 1
    end
  end
  Olympian.import(olympians.values)
end
