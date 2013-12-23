module APPEngine
  module DataSearch

    def search_app_data_by_obj_name(obj_name, org = Org::SYS, ids = nil, size = nil, page = nil, order_by = nil, reversed = false)
      options={}
      options[:org] = org
      options[:obj_name] = obj_name
      options[:ids] = ids
      options[:page] = page || 1
      options[:size] = size || SYS::DEFAULT_SIZE
      options[:order_by] = order_by || %w(guid)
      options[:reversed] = reversed
      return search_app_data_by_obj(options)
    end

    def search_app_data_by_obj_id(obj_id, org = Org::SYS, ids = nil, size = nil, page = nil, order_by = nil, reversed = false)
      options={}
      options[:org] = org
      options[:obj_id] = obj_id
      options[:ids] = ids
      options[:page] = page || 1
      options[:size] = size || SYS::DEFAULT_SIZE
      options[:order_by] = order_by || %w(guid)
      options[:reversed] = reversed
      return search_app_data_by_obj(options)
    end

    def search_child_app_data_id_by_relation(instance_id, org = Org::SYS)
      relations = Relationship.select_relationship_p_2_c.by_org_data(org,instance_id)
      if relations.nil? or relations.empty?
        raise SYS::RelationNotValid, 'relation is not existed'
      end
      r = []
      ids = []
      relations.each do |relation|
        r[0] = relation.target_obj_id
        ids << relation.relation_id
      end
      r[1] = ids
      return r
    end

    def search_app_data_by_index(obj_id, org = Org::SYS, conditions = [])
      options={}
      options[:org] = org
      options[:obj_id] = obj_id
      options[:conditions] = conditions
      options[:size] = 0
      options[:order_by] = %w(guid)
      options[:reversed] = false
      return search_app_data_by_obj(options)
    end

    private
      ARGUMENT_ERROR = 0
      OBJ_NOT_FOUND = 1
      FIELD_NOT_FOUND = 2
      NORMAL = 3
      NO_RESULT = 4
      def generate_sql
        sql = 'guid, obj_id'
        @fields.each do |field|
          sql << ',v'
          sql << field.num.to_s
          sql << ' as '
          sql << field.name
        end
        return sql
      end

      def verify_search_arguments(options)
        if options.nil? or options.empty?
          return ARGUMENT_ERROR
        end

        if options[:org].nil? or (options[:obj_name].nil? and options[:obj_id].nil?)
          return ARGUMENT_ERROR
        end

        if !options[:obj_id].nil? and (@obj = MetaData.active.by_id(options[:obj_id])).nil?
          return OBJ_NOT_FOUND
        end

        if !options[:obj_name].nil? and (@obj = MetaData.active.by_name(options[:org],options[:obj_name]).first).nil?
           return OBJ_NOT_FOUND
        end

        if (@fields = MetaDataField.all_fields.by_id(@obj.obj_id)).empty?
          return FIELD_NOT_FOUND
        end

        if !options[:conditions].nil?
          return ARGUMENT_ERROR if options[:conditions].empty?
          options[:conditions].each do |condition|
            @fields.each do |field|
              condition[:type] = FieldValue.field_type_convert(field.type) if field.name == condition[:name]
            end
          end
          ids = IndexValue.select_value.by_conditions(options[:conditions]).by_org_obj(options[:org], options[:obj_id])
          unless ids.empty?
            options[:ids] = []
            ids.each {|id|options[:ids]<<id.instance_id}
          else
            return NO_RESULT
          end
        end

        return NORMAL
      end

      def search_app_data_by_obj(options)
        case verify_search_arguments(options)
          when ARGUMENT_ERROR
            raise  ArgumentError, 'arguments are not valid'
          when OBJ_NOT_FOUND
            raise SYS::ObjNotValid, 'obj is not existed'
          when FIELD_NOT_FOUND
            raise SYS::FieldNotValid, 'field is not existed'
          when NO_RESULT
            return []
          when NORMAL
            sql = generate_sql
            c = AppData.select_data(sql).by_obj_id(@obj.obj_id)
            if options[:size].to_i == 0
              c = (options[:reversed])? c.order_by(options[:order_by]).reverse : c.order_by(options[:order_by])
            else
              c = (options[:reversed])? c.page(options[:page],options[:size]).order_by(options[:order_by]).reverse : c.page(options[:page],options[:size]).order_by(options[:order_by])
            end
            return (options[:ids].nil?)? c : c.by_group_of_id(options[:ids])
        end
      end

  end
end