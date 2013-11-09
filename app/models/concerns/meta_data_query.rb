module MetaDataQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
  end


  module ClassMethods
    def get_active_obj(sql, *value)
      begin_sql = 'is_active > 0'
      if !sql.blank?
        begin_sql << ' and ('+sql+')'
      end
      where(begin_sql, *value)
    end

    def get_active_obj_by_name(org, name)
      sql = 'org_id = ? and obj_name = ?'
      get_active_obj(sql, org, name).first
    end

    def get_active_obj_by_id(id)
      sql = 'obj_id = ?'
      get_active_obj(sql, id).first
    end
  end

end