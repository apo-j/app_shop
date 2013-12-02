module MetaDataFieldQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :all_fields, ->{select("field_id, field_name as name, field_type, field_num as num").joins("left outer join meta_data on meta_data.obj_id = meta_data_fields.obj_id")}
    scope :by_name,    ->(org,name){where("meta_data.obj_name = ? and meta_data.org_id = ?",name,org)}
    scope :by_id,      ->(id){where("meta_data.obj_id = ?",id)}
  end

  module ClassMethods
  end

end