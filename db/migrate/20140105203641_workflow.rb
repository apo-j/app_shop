class Workflow < ActiveRecord::Migration
  def change
    create_table :work_flow, primary_key: :flow_id, options: 'auto_increment = 10000' do |t|
      t.integer :org_id
      t.string :state
      t.integer :instance_id
      t.integer :identity
      t.integer :lock_version
      t.timestamps
    end

    add_index :work_flow, [:org_id, :state, :identity], name: :by_org_state_identity
    add_index :work_flow, [:org_id, :instance_id, :identity], name: :by_org_instance_identity
    add_index :work_flow, [:org_id, :state], name: :by_org_state
    add_index :work_flow, [:state], name: :by_state
  end

end
