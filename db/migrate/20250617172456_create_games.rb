class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :location
      t.integer :num_items
      t.integer :time_limit
      t.integer :penalty
      t.string :scoring_mode
      t.string :uuid

      t.timestamps
    end
    add_index :games, :uuid
  end
end
