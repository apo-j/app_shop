class CreateUniqueFields < ActiveRecord::Migration
  def change
    create_table :unique_fields do |t|
      t.integer :org_id
      t.integer :obj_id
      t.string :field_name
      t.integer :instance_id
      t.string :value
      t.integer :lock_version
      t.timestamps
    end

    add_column :meta_data_fields, :is_unique, :boolean, null: false, default: false

    add_index :unique_fields, [:org_id, :obj_id, :field_name], unique: true, name: :by_org_obj_field
  end
end
