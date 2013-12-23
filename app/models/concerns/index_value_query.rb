module IndexValueQuery
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    scope :by_org_obj,      ->(org,obj){where('org_id = ? and obj_id = ?',org,obj)}
    scope :select_value,    ->{select('id, instance_id')} do
      def by_conditions (options)
        sql = ''
        options.each do |option|
          if option[:type] == :string
            sql << "(field_name = '#{option[:name]}' and idx_#{option[:type]} #{option[:op]} '#{option[:value]}')"
          else
            sql << "(field_name = '#{option[:name]}' and idx_#{option[:type]} #{option[:op]} #{option[:value]})"
          end
          sql << 'or '
        end
        sql = sql[0,sql.length - 3] unless sql.blank?
        where(sql).group('instance_id').having('count(instance_id) = ?', options.length)
      end
    end
  end

  module ClassMethods
  end

end