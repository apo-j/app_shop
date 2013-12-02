class MetaDataField < ActiveRecord::Base
  include MetaDataFieldAssociation
  include MetaDataFieldValidations
  include MetaDataFieldQuery
  include Share::ModelHelper
  def set_composite(*fields)
    self.field_name = FieldValue.set_composite_name(*field_name)
    self.field_type = FieldValue::Type::COMPOSITE
    self.is_indexed = true
  end

end
