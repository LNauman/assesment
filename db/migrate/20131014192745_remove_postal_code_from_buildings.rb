class RemovePostalCodeFromBuildings < ActiveRecord::Migration
  def up
    remove_column :buildings, :postal_code
  end
  
  def down
    add_column :buildings, :postal_code, :integer
  end
end
