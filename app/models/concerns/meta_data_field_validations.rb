module MetaDataFieldValidations
  extend ActiveSupport::Concern

  included do
    validates :org_id, :field_name, :field_type, :field_num, :is_indexed, :is_unique, presence: {message: ErrorMSG::Model::MSG[:p]}
    validates :field_name, uniqueness: {scope: :obj, message: ErrorMSG::Model::MSG[:uq]}
    validates :field_num, uniqueness: {scope: :obj, message: ErrorMSG::Model::MSG[:uq]}
    validates :field_name, length: {in:3..100}, presence: {message: ErrorMSG::Model::MSG[:len]}
    validates :field_name, format: {with: /\A[a-zA-Z0-9]+\z/, message: ErrorMSG::Model::MSG[:reg]}
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