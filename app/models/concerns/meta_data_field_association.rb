module MetaDataFieldAssociation
  extend ActiveSupport::Concern

  included do
    belongs_to :obj, class_name: "MetaData"
  end

  module ClassMethods
  end

end