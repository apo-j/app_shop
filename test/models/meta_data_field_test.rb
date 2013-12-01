require 'test_helper'

class MetaDataFieldTest < ActiveSupport::TestCase

  set_fixture_class meta_data: "MetaData"
  set_fixture_class meta_data_fields: "MetaDataField"

  test "list all fields" do
     fields = MetaDataField.all_fields.by_id(meta_data(:one).obj_id)
     puts fields.to_json
     assert fields.any?
     fields = MetaDataField.all_fields.by_name(meta_data(:one).org_id,meta_data(:one).obj_name)
     puts fields.to_json
     assert fields.any?
  end

  test "load obj" do
    obj = MetaDataField.find(meta_data_fields(:f1).field_id).obj
    puts obj.to_json
    assert_not_nil obj
  end

end
