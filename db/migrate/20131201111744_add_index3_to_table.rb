class AddIndex3ToTable < ActiveRecord::Migration
  def change
    add_index :app_data, [:org_id, :nature_name], name: :by_org_nature_name
  end
end
