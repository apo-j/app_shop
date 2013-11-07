class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :org_id
      t.integer :obj_id
      t.belongs_to :instance, class_name: "AppData"
      t.integer :target_obj_id
      t.integer :relation_id
      t.integer :lock_version
      t.timestamps
    end

    add_index :relationships,[:org_id, :instance_id], name: "by_org_data"
    add_index :relationships,[:org_id, :instance_id, :target_obj_id, :relation_id], name: "by_all"

    execute %{
      ALTER TABLE relationships
      ADD CONSTRAINT fk_relationship_data
      FOREIGN KEY (instance_id)
      REFERENCES app_data (guid)
      ON DELETE CASCADE;
    }

  end
end
