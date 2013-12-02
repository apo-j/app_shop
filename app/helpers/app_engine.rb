module APPEngine
  module DataSearch

    def search_app_data_by_obj_name(org=Org::SYS, obj_name, page = 1, size = SYS::DEFAULT_SIZE, order_by = [%w(guid)], reversed = false)
      options[:org] = org
      options[:obj_name] = obj_name
      options[:page] = page
      options[:size] = size
      options[:order_by] = order_by
      options[:reversed] = reversed
      return search_app_data_by_obj(options)
    end

    def search_app_data_by_obj_id(org=Org::SYS, obj_id, page = 1, size = SYS::DEFAULT_SIZE, order_by = [%w(guid)], reversed = false)
      options[:org] = org
      options[:obj_id] = obj_id
      options[:page] = page
      options[:size] = size
      options[:order_by] = order_by
      options[:reversed] = reversed
      return search_app_data_by_obj(options)
    end

    private
      ARGUMENT_ERROR = 0
      OBJ_NOT_FOUND = 1
      FIELD_NOT_FOUND = 2
      NORMAL = 3

      def generate_sql
        sql = 'guid'
        @fields.each do |field|
          sql << ',v'
          sql << field.num
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

        return NORMAL
      end

      def search_app_data_by_obj(options)
        case verify_search_arguments(options)
          when ARGUMENT_ERROR
            raise  ArgumentError, %w(arguments are not valid)
          when OBJ_NOT_FOUND
            raise AppShopError::ObjNotValid, %w(obj is not existed)
          when FIELD_NOT_FOUND
            raise AppShopError::FieldNotValid, %w(field is not existed)
          when NORMAL
            sql = generate_sql
            if options[:size].to_i == 0
              return (options[:reversed])? AppData.select_data(sql).order_by(options[:order_by]).reverse : AppData.select_data(sql).order_by(options[:order_by])
            else
              return (options[:reversed])? AppData.select_data(sql).page(options[:page],options[:size]).order_by(options[:order_by]).reverse : AppData.select_data(sql).page(options[:page],options[:size]).order_by(options[:order_by])
            end
        end
      end

  end
end