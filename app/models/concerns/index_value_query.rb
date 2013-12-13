module IndexValueQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :by_org_obj_field, ->(org,obj,field){where('org_id = ? and obj_id = ? field_name = ?',org,obj,field)}
    scope :select_value,    ->(type,surname){select("id, instance_id as instance, idx_#{type} as #{surname}")} do
      def range_int(*values)
        where(idx_int: values)
      end

      def range_double(*values)
        where(idx_double: values)
      end

      def range_string(*values)
        if value.length > 1
          where(idx_string: values)
        elsif value.length = 1
          where('idx_string LIKE %?', values[0])
        end
      end

      def compare_int(*operations)
        sql = ''
        operations.each do |operation|
          sql << "idx_int #{operation[:op]} #{operation[:v]} or "
        end
        sql = sql[0, sql.length - 3] unless sql.blank?
        where(sql)
      end

      def compare_double(*operations)
        sql = ''
        operations.each do |operation|
          sql << "idx_double #{operation[:op]} #{operation[:v]} or "
        end
        sql = sql[0, sql.length - 3] unless sql.blank?
        where(sql)
      end
    end
  end

  module ClassMethods
  end

end