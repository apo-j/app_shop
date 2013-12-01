module AppDataAssociation
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    belongs_to :obj, class_name: "MetaData", foreign_key: "obj_id"
    has_many :index_values, foreign_key: "instance_id", dependent: :delete_all
    has_many :relationships, foreign_key: "instance_id", dependent: :delete_all
  end

  module ClassMethods
  end

end