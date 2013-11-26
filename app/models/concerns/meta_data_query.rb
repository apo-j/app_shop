module MetaDataQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :active,             ->{where("is_active > 0")}
    scope :include_fields,     ->{includes(:fields)}
    scope :include_instances,  ->{includes(:instances)}
    scope :by_name,            ->(org,name){where("org_id = ? and obj_name = ?",org,name)}
    scope :by_id,              ->(id){find(id)}
    scope :by_org,             ->(org){where("org_id = ?",org)}
    scope :all_system_objs,    ->{by_org(Org::SYS)}
  end


  module ClassMethods
  end

end