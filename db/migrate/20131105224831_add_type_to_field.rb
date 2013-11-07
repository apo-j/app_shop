class AddTypeToField < ActiveRecord::Migration
  def change
    add_column :meta_data_fields, :field_type, :string
  end
end
