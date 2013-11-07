class MetaData < ActiveRecord::Base
  has_many :fields, class_name: "MetaDataField", dependent: :delete_all
  has_many :instances, class_name: "AppData", dependent: :delete_all
end
