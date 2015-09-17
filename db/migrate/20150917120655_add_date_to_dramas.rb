class AddDateToDramas < ActiveRecord::Migration
  def change
    add_column :dramas,:day,:date
  end
end
