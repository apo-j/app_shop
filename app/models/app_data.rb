class AppData < ActiveRecord::Base
  include AppDataAssociation
  include AppDataQuery
  include AppDataValidations
  include Share::ModelHelper
end
