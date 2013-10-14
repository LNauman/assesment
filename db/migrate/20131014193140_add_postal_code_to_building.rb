class AddPostalCodeToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :postal_code, :string
  end

  def down
    remove_column :buildings, :postal_code
  end
end
