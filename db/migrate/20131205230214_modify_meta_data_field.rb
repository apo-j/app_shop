class ModifyMetaDataField < ActiveRecord::Migration
  def change
    remove_column :meta_data_fields, :is_indexed
    add_column :meta_data_fields, :is_indexed, :boolean, null: false, default: false
  end
end
