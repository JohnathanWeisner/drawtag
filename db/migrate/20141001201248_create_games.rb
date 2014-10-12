class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :max_entries
      t.references :user, index: true
      t.boolean :complete

      t.timestamps
    end
  end
end
