module ApplicationHelper
  include APPEngine::DataSearch

  def get_navbar_by_org_obj(org_id, obj_name)
    response = {}
    response[:data] = []
    begin
    res = search_app_data_by_obj_name(obj_name,org_id)
    res.each do |o|
      item = {}
      item[:obj] = o
      begin
        r = search_child_app_data_id_by_relation(o.guid,org_id)
        item[:children] = search_app_data_by_obj_id(r[0],org_id,r[1])
      rescue StandardError
        item[:children] = []
      end
      response[:data] << item
     end
    # response[:obj][:children] = search_child_app_data_id_by_relation(response[:obj].guid, org_id)
     response[:status] = 'OK'
    rescue SYS::ObjNotValid
      response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      response[:status] = 'not valide2'
    rescue StandardError
      response[:status] = 'not valide3'
    end
    return response.to_json
  end
end
