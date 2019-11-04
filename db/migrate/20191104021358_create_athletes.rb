class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :team
      t.integer :age
      t.string :sport
      t.integer :total_medals_won

      t.timestamps
    end
  end
end
