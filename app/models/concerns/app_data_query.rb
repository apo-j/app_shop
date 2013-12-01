module AppDataQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :select_data,         ->(sql){select(sql)}
    scope :by_group_of_id,      ->(*ids){find(ids)}
    scope :by_nature_name,      ->(org,name){where('nature_name = ? and org_id = ?',name, org)}
    scope :select_obj,          ->{select('guid,obj_id as obj')}
  end

  module ClassMethods
  end

end