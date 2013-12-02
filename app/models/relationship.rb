class Relationship < ActiveRecord::Base
  include RelationshipAssociation
  include RelationshipQuery
  include Share::ModelHelper
end
