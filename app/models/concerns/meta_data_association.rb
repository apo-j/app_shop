module MetaDataAssociation
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    has_many :fields, class_name: "MetaDataField", dependent: :delete_all
    has_many :instances, class_name: "AppData", dependent: :delete_all
  end

  module ClassMethods
  end

end