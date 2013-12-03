module ApplicationHelper
  include APPEngine::DataSearch

  def get_navbar_by_org_obj(org_id, obj_name)
    begin
      return search_app_data_by_obj_name(obj_name,org_id).to_json
    rescue SYS::ObjNotValid
      #TODO

    rescue SYS::FieldNotValid
    #TODO

    rescue StandardError   #TODO
      return {}
    end
  end
end
