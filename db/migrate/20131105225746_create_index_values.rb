class CreateIndexValues < ActiveRecord::Migration
  def change
    create_table :index_values do |t|
      t.belongs_to :instance, class_name: "AppData"
      t.integer :org_id
      t.integer :obj_id
      t.string :field_name
      t.string :field_type
      t.integer :field_num
      t.integer :idx_int
      t.string :idx_string
      t.float :idx_double
    end
    add_index :index_values, [:org_id,:obj_id,:field_name], unique: true, name: "by_org_obj_field"
    add_index :index_values, [:org_id,:obj_id,:field_name,:idx_int], name: "by_int"
    add_index :index_values, [:org_id,:obj_id,:field_name,:idx_string], name: "by_string"
    add_index :index_values, [:org_id,:obj_id,:field_name,:idx_double], name: "by_double"

    execute %{
      ALTER TABLE index_values
      ADD CONSTRAINT fk_index_data
      FOREIGN KEY (instance_id)
      REFERENCES app_data (guid)
      ON DELETE CASCADE;
    }

  end
end
