module MetaDataValidations
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    validates :org_id, :obj_name,  presence:{message: ErrorMSG::Model::MSG[:p]}
    validates :obj_name, uniqueness: {scope: :org_id, message: ErrorMSG::Model::MSG[:uq]}
  end

  module ClassMethods

     def is_obj_name_unique(org_id, name)
      if where("org_id = ? and obj_name = ?", org_id, name).empty?
        return true
      else
        return false
      end
     end

  end

end