class DeleteWrongWorkflow < ActiveRecord::Migration
  def change
    drop_table :work_flow
  end
end
