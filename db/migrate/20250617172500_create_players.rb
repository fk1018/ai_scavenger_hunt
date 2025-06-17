class CreatePlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :players do |t|
      t.references :game, null: false, foreign_key: true
      t.string :name
      t.boolean :admin
      t.integer :total_score

      t.timestamps
    end
  end
end
