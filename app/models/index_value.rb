class IndexValue < ActiveRecord::Base
  include IndexValueAssociation
  include IndexValueQuery
  include ModelHelper
end
