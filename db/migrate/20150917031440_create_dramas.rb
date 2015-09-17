class CreateDramas < ActiveRecord::Migration
  def change
    create_table :dramas do |t|
      t.string :name
      t.text :description
      t.text :actor
      t.integer :set
      t.datetime :time
      t.timestamps null: false
    end
  end
end
