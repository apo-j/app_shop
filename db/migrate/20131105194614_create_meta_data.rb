class CreateMetaData < ActiveRecord::Migration
  def change
    create_table :meta_data, primary_key: :obj_id, options: "auto_increment = 1000"  do |t|
      t.integer :org_id
      t.string :obj_name
      t.boolean :is_active, null: false, default: true
      t.integer :lock_version
      t.timestamps
    end
  end
end
