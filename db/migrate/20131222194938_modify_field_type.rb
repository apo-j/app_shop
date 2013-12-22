class ModifyFieldType < ActiveRecord::Migration
  def change
    remove_column :meta_data_fields, :field_type
    remove_column :index_values, :field_type
    add_column :meta_data_fields, :field_type, :integer
    add_column :index_values, :field_type, :integer
  end
end
