class CreateAppData < ActiveRecord::Migration
  def change
    create_table :app_data, primary_key: :guid, options: "auto_increment = 10000"  do |t|
      t.belongs_to :obj, class_name: "MetaData"
      t.integer :org_id
      t.string :nature_name
      t.integer :lock_version
      t.timestamps
      for i in 1..200
        t.text "v#{i}"
      end
    end

    execute %{
      ALTER TABLE app_data
      ADD CONSTRAINT fk_data_obj
      FOREIGN KEY (obj_id)
      REFERENCES meta_data (obj_id)
      ON DELETE CASCADE;
    }

  end
end
