require 'csv'

task import: :environment do
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    if row["medal"] == "NA"
      row["medal"] = nil
    end
    Olympian.create!(row.to_hash)
  end

  athletes = {}
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    if !athletes.include?(row["name"])
      athletes[row['name']] =
      {
        name: row["name"],
        team: row["team"],
        age: row["age"],
        sport: row["sport"],
        total_medals_won: 0,
        weight: row["weight"],
        sex: row["sex"],
      }
    end

    if row["medal"] != "NA"
      athletes[row["name"]][:total_medals_won] += 1
    end
  end
  Athlete.import(athletes.values)
end
