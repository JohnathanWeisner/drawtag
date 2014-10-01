class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :content
      t.string :type
      t.references :user, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
