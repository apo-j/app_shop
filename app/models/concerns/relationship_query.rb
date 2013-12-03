module RelationshipQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :select_relationship_p_2_c, ->{select('id, org_id, target_obj_id, relation_id')}
    scope :by_org_data,               ->(org,ins){where('org_id = ? and instance_id = ?',org,ins)}
    scope :select_relationship_c_2_p, ->{select('id, org_id, obj_id, instance_id')}
    scope :by_all,                    ->(org,obj,target,relation){where('org_id = ? and obj_id = ? and target_obj_id = ? and relation_id = ?', org, obj,target, relation)}
  end

  module ClassMethods
  end

end