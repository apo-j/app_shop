class CreateNameDenorms < ActiveRecord::Migration
  def change
    create_table :name_denorms do |t|
      t.integer :org_id
      t.string :obj_name
      t.integer :obj_id
      t.integer :instance_id
      t.string :nature_name
      t.integer :lock_version
      t.timestamps
    end
    add_column :index_values, :lock_version,:integer
    add_column :index_values, :created_at, :timestamp
    add_column :index_values, :updated_at, :timestamp

    add_index :name_denorms, [:org_id, :obj_name], name: :by_org_obj_name
    add_index :name_denorms, [:org_id, :obj_id], name: :by_org_obj_id
  end
end
