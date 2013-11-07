class AppData < ActiveRecord::Base
  belongs_to :obj, class_name: "MetaData"
  has_many :index_values, dependent: :delete_all
  has_many :relationships, dependent: :delete_all
end
