class MetaData < ActiveRecord::Base
  include MetaDataAssociation
  include MetaDataValidations
  include MetaDataQuery
end
