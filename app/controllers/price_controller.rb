class PriceController < ApplicationController
  def index
    @response = {}
    @response[:data] = {}
    begin
      @response[:data]['matiere'] = search_app_data_by_obj_name("matiere",100)

      @response[:data]['coloris'] = search_app_data_by_obj_name("coloris",100)
      @response[:data]['type'] = search_app_data_by_obj_name("type_fenetre",100)
      @response[:data]['dimension'] = {width: {value:0, range: {left: 50, right:160}}, height:{value:0, range:{left:45, right:95}} }

      @response[:status] = 'OK'
    rescue SYS::ObjNotValid
      @response[:status] = 'not valide'
    rescue SYS::FieldNotValid
      @response[:status] = 'not valide2'
    rescue StandardError
      @response[:status] = 'not valide3'
    end
  end
end
