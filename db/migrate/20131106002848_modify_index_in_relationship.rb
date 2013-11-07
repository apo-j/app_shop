class ModifyIndexInRelationship < ActiveRecord::Migration
  def change
    remove_index :relationships, name: "by_all"
    add_index :relationships,[:org_id, :obj_id, :target_obj_id, :relation_id], name: "by_all"
  end
end
