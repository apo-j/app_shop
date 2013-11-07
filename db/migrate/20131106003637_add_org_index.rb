class AddOrgIndex < ActiveRecord::Migration
  def change
    add_index :meta_data, :org_id, name: :by_org
    add_index :meta_data_fields, :org_id, name: :by_org
    add_index :app_data, :org_id, name: :by_org
  end
end
