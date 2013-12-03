module ApplicationHelper
  include APPEngine::DataSearch

  def get_navbar_by_org_obj(org_id, obj_name)
    search_app_data_by_obj_name(org_id, obj_name,page:1, size:0).to_json
  end
end
