module MetaDataFieldValidations
  extend ActiveSupport::Concern

  included do
    validates :org_id, :field_name, :field_type, :field_num, :is_indexed, presence: {message: ErrorMSG::Model::MSG[:p]}
    validates :field_name, uniqueness: {scope: :obj, message: ErrorMSG::Model::MSG[:uq]}
    validates :field_num, uniqueness: {scope: :obj, message: ErrorMSG::Model::MSG[:uq]}
    validates_with IndexValidator, if: :is_indexed
  end

  module ClassMethods
  end

  class IndexValidator < ActiveModel::Validator

    def validate(record)
      case record.field_type
        when FieldValue::Type::STRING, FieldValue::Type::INT, FieldValue::Type::DOUBLE, FieldValue::Type::COMPOSITE
          return
        else
          record.errors.add(:index, ErrorMSG::Model::MSG[:idx])
      end


    end

  end

end