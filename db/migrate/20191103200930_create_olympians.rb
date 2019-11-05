class CreateOlympians < ActiveRecord::Migration[5.2]
  def change
    create_table :olympians do |t|
      t.string :name
      t.string :team
      t.integer :age
      t.string :sport
      t.integer :total_medals_won
      t.integer :weight
      t.string :sex
      t.string :event
      t.string :medal

      t.timestamps
    end
  end
end
