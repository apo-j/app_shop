require 'test_helper'

class MetaDataTest < ActiveSupport::TestCase
  set_fixture_class meta_data: "MetaData"
  # test "the truth" do
  #   assert true
  # end
  test "org and name should not null" do
      obj = MetaData.new
      errors = MetaData.get_errors(obj)
      assert errors[:org_id].any?
      assert errors[:obj_name].any?
  end

  test "obj name should be unique in org" do
    obj = MetaData.new(org_id: meta_data(:one).org_id,
                       obj_name: meta_data(:one).obj_name,
                       is_active: true)
    errors = MetaData.get_errors(obj)
    assert errors[:obj_name].any?
    puts errors.to_json
  end


  test "check name field" do
    assert !MetaData.is_obj_name_unique(
        meta_data(:one).org_id,
        meta_data(:one).obj_name)
  end

  test "find obj by name" do
    obj = MetaData.get_active_obj_by_name(meta_data(:one).org_id, meta_data(:one).obj_name)
    assert_not_nil obj

    obj = MetaData.get_active_obj_by_name(meta_data(:two).org_id, meta_data(:two).obj_name)
    assert_nil obj
  end

  test "find obj by id" do
    obj = MetaData.new(org_id: 200, obj_name: 'test', is_active:true)
    assert obj.save
    assert_not_nil MetaData.get_active_obj_by_id(obj.obj_id)
  end

end
