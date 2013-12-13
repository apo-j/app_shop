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

  test "not null" do
    field = MetaDataField.new
    errs = MetaDataField.get_errors(field)
    assert errs.any?
    assert errs[:org_id].any?
    assert errs[:field_name].any?
    assert errs[:field_num].any?
    assert errs[:field_type].any?
    assert errs[:is_indexed].any?
    assert errs[:is_unique].any?
  end

  test "unique" do

  end

end
