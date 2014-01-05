class ModifyIndexValueIndex < ActiveRecord::Migration
  def change
    remove_index :index_values, name: 'by_org_obj_field'
    add_index :index_values, [:org_id,:obj_id,:field_name], name: 'by_org_obj_field'
  end
end
