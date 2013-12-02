module MetaDataFieldAssociation
  extend ActiveSupport::Concern

  included do
    belongs_to :obj, class_name: "MetaData", foreign_key: "obj_id"
  end

  module ClassMethods
  end

end