class AddOwnerIdToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :owner_id, :integer, null: false
  end

  def down
    remove_column :buildings, :owner_id
  end
end
