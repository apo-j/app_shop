class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :meta_data, [:org_id, :obj_name], unique: true, name: :by_org_name
  end
end
