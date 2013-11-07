class IndexValue < ActiveRecord::Base
  belongs_to :instance, class_name: AppData
end
