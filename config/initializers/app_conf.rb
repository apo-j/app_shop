module ErrorMSG #error message
  module Model
    RESPONSE = :response
    MSG =
        {
            OK: '200',
            KO: '400',
            p: '1000',
            uq: '1001',
            idx: '1010',
            len: '1020',
            reg: '1030'
        }
  end
end




module FieldValue      #meta_data_field conf
  MAX = 255
  COMPOSITE_SEP = ':'
  module Type
    STRING = 1
    INT = 2
    DOUBLE = 3
    BOOLEAN = 4
    PLAIN_TEXT = 5
    JSON = 6
    XML = 7
    IMAGE = 8
    VIDEO = 9
    RADIO = 10
    CSS = 11
    HTML = 12
    URL = 13
    OTHER = 14
  end

  def self.is_can_be_indexed(field)
    if !field.nil? and field.length <= MAX
      return true
    else
      return false
    end
  end

  def self.set_composite_name(*fields)
    if fields.length < 2
      return nil
    end
    name = ''
    fields.each do |field|
      name << field
      name << COMPOSITE_SEP
    end
    return name[0, name.length-1]
  end

  def self.field_value_convert(type, value)
    case type
      when Type::STRING, Type::PLAIN_TEXT..Type::IMAGE,Type::CSS..Type::URL
        return value.to_s
      when Type::INT
        return Integer(value)
      when Type::DOUBLE
        return Float(value)
      else
        return nil # change later
    end
  end


end

module Org
  SYS = 0
end

module SYS
  DEFAULT_SIZE = 20
  class ObjNotValid < StandardError
  end

  class FieldNotValid < StandardError
  end

  class RelationNotValid < StandardError
  end

end
