class CreateMetaDataFields < ActiveRecord::Migration
  def change
    create_table :meta_data_fields, primary_key: :field_id do |t|
      t.belongs_to :obj, class_name: "MetaData"
      t.integer :org_id
      t.string :field_name
      t.integer :field_num
      t.boolean :is_indexed, null:false, default:true
      t.integer :lock_version
      t.timestamps
    end

    execute %{
      ALTER TABLE meta_data_fields
      ADD CONSTRAINT fk_field_obj
      FOREIGN KEY (obj_id)
      REFERENCES meta_data (obj_id)
      ON DELETE CASCADE;
    }

  end
end
