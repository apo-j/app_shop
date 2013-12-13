module IndexValueAssociation
  # To change this template use File | Settings | File Templates.
  extend ActiveSupport::Concern

  included do
    belongs_to :instance, class_name: AppData
  end

  module ClassMethods
  end

end