class CreateSubmissions < ActiveRecord::Migration[7.2]
  def change
    create_table :submissions do |t|
      t.references :player, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :photo
      t.boolean :correct
      t.integer :points

      t.timestamps
    end
  end
end
