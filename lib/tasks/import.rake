require 'csv'

task import: :environment do
  CSV.foreach('db/csv_data/olympians.csv', headers: true) do |row|
    Olympian.create!(row.to_hash)
  end
end
