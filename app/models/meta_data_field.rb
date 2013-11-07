class MetaDataField < ActiveRecord::Base
  belongs_to :obj, class_name: "MetaData"
end
