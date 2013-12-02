class AddIndex2ToTable < ActiveRecord::Migration
  def change
    add_index :meta_data_fields, [:obj_id, :field_name], unique: true, name: :by_obj_field
    add_index :meta_data_fields, [:obj_id, :field_num], unique: true, name: :by_obj_num
  end
end
