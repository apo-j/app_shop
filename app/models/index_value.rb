class IndexValue < ActiveRecord::Base
  include IndexValueAssociation
  include IndexValueQuery
  include Share::ModelHelper
end
