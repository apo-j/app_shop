# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131222194938) do

  create_table "app_data", primary_key: "guid", force: true do |t|
    t.integer  "obj_id"
    t.integer  "org_id"
    t.string   "nature_name"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "v1"
    t.text     "v2"
    t.text     "v3"
    t.text     "v4"
    t.text     "v5"
    t.text     "v6"
    t.text     "v7"
    t.text     "v8"
    t.text     "v9"
    t.text     "v10"
    t.text     "v11"
    t.text     "v12"
    t.text     "v13"
    t.text     "v14"
    t.text     "v15"
    t.text     "v16"
    t.text     "v17"
    t.text     "v18"
    t.text     "v19"
    t.text     "v20"
    t.text     "v21"
    t.text     "v22"
    t.text     "v23"
    t.text     "v24"
    t.text     "v25"
    t.text     "v26"
    t.text     "v27"
    t.text     "v28"
    t.text     "v29"
    t.text     "v30"
    t.text     "v31"
    t.text     "v32"
    t.text     "v33"
    t.text     "v34"
    t.text     "v35"
    t.text     "v36"
    t.text     "v37"
    t.text     "v38"
    t.text     "v39"
    t.text     "v40"
    t.text     "v41"
    t.text     "v42"
    t.text     "v43"
    t.text     "v44"
    t.text     "v45"
    t.text     "v46"
    t.text     "v47"
    t.text     "v48"
    t.text     "v49"
    t.text     "v50"
    t.text     "v51"
    t.text     "v52"
    t.text     "v53"
    t.text     "v54"
    t.text     "v55"
    t.text     "v56"
    t.text     "v57"
    t.text     "v58"
    t.text     "v59"
    t.text     "v60"
    t.text     "v61"
    t.text     "v62"
    t.text     "v63"
    t.text     "v64"
    t.text     "v65"
    t.text     "v66"
    t.text     "v67"
    t.text     "v68"
    t.text     "v69"
    t.text     "v70"
    t.text     "v71"
    t.text     "v72"
    t.text     "v73"
    t.text     "v74"
    t.text     "v75"
    t.text     "v76"
    t.text     "v77"
    t.text     "v78"
    t.text     "v79"
    t.text     "v80"
    t.text     "v81"
    t.text     "v82"
    t.text     "v83"
    t.text     "v84"
    t.text     "v85"
    t.text     "v86"
    t.text     "v87"
    t.text     "v88"
    t.text     "v89"
    t.text     "v90"
    t.text     "v91"
    t.text     "v92"
    t.text     "v93"
    t.text     "v94"
    t.text     "v95"
    t.text     "v96"
    t.text     "v97"
    t.text     "v98"
    t.text     "v99"
    t.text     "v100"
    t.text     "v101"
    t.text     "v102"
    t.text     "v103"
    t.text     "v104"
    t.text     "v105"
    t.text     "v106"
    t.text     "v107"
    t.text     "v108"
    t.text     "v109"
    t.text     "v110"
    t.text     "v111"
    t.text     "v112"
    t.text     "v113"
    t.text     "v114"
    t.text     "v115"
    t.text     "v116"
    t.text     "v117"
    t.text     "v118"
    t.text     "v119"
    t.text     "v120"
    t.text     "v121"
    t.text     "v122"
    t.text     "v123"
    t.text     "v124"
    t.text     "v125"
    t.text     "v126"
    t.text     "v127"
    t.text     "v128"
    t.text     "v129"
    t.text     "v130"
    t.text     "v131"
    t.text     "v132"
    t.text     "v133"
    t.text     "v134"
    t.text     "v135"
    t.text     "v136"
    t.text     "v137"
    t.text     "v138"
    t.text     "v139"
    t.text     "v140"
    t.text     "v141"
    t.text     "v142"
    t.text     "v143"
    t.text     "v144"
    t.text     "v145"
    t.text     "v146"
    t.text     "v147"
    t.text     "v148"
    t.text     "v149"
    t.text     "v150"
    t.text     "v151"
    t.text     "v152"
    t.text     "v153"
    t.text     "v154"
    t.text     "v155"
    t.text     "v156"
    t.text     "v157"
    t.text     "v158"
    t.text     "v159"
    t.text     "v160"
    t.text     "v161"
    t.text     "v162"
    t.text     "v163"
    t.text     "v164"
    t.text     "v165"
    t.text     "v166"
    t.text     "v167"
    t.text     "v168"
    t.text     "v169"
    t.text     "v170"
    t.text     "v171"
    t.text     "v172"
    t.text     "v173"
    t.text     "v174"
    t.text     "v175"
    t.text     "v176"
    t.text     "v177"
    t.text     "v178"
    t.text     "v179"
    t.text     "v180"
    t.text     "v181"
    t.text     "v182"
    t.text     "v183"
    t.text     "v184"
    t.text     "v185"
    t.text     "v186"
    t.text     "v187"
    t.text     "v188"
    t.text     "v189"
    t.text     "v190"
    t.text     "v191"
    t.text     "v192"
    t.text     "v193"
    t.text     "v194"
    t.text     "v195"
    t.text     "v196"
    t.text     "v197"
    t.text     "v198"
    t.text     "v199"
    t.text     "v200"
  end

  add_index "app_data", ["obj_id"], name: "fk_data_obj", using: :btree
  add_index "app_data", ["org_id", "nature_name"], name: "by_org_nature_name", using: :btree
  add_index "app_data", ["org_id"], name: "by_org", using: :btree

  create_table "index_values", force: true do |t|
    t.integer  "instance_id"
    t.integer  "org_id"
    t.integer  "obj_id"
    t.string   "field_name"
    t.integer  "field_num"
    t.integer  "idx_int"
    t.string   "idx_string"
    t.float    "idx_double"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_type"
  end

  add_index "index_values", ["instance_id"], name: "fk_index_data", using: :btree
  add_index "index_values", ["org_id", "obj_id", "field_name", "idx_double"], name: "by_double", using: :btree
  add_index "index_values", ["org_id", "obj_id", "field_name", "idx_int"], name: "by_int", using: :btree
  add_index "index_values", ["org_id", "obj_id", "field_name", "idx_string"], name: "by_string", using: :btree
  add_index "index_values", ["org_id", "obj_id", "field_name"], name: "by_org_obj_field", unique: true, using: :btree

  create_table "meta_data", primary_key: "obj_id", force: true do |t|
    t.integer  "org_id"
    t.string   "obj_name"
    t.boolean  "is_active",    default: true, null: false
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meta_data", ["org_id", "obj_name"], name: "by_org_name", unique: true, using: :btree
  add_index "meta_data", ["org_id"], name: "by_org", using: :btree

  create_table "meta_data_fields", primary_key: "field_id", force: true do |t|
    t.integer  "obj_id"
    t.integer  "org_id"
    t.string   "field_name"
    t.integer  "field_num"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_unique",    default: false, null: false
    t.boolean  "is_indexed",   default: false, null: false
    t.integer  "field_type"
  end

  add_index "meta_data_fields", ["obj_id", "field_name"], name: "by_obj_field", unique: true, using: :btree
  add_index "meta_data_fields", ["obj_id", "field_num"], name: "by_obj_num", unique: true, using: :btree
  add_index "meta_data_fields", ["org_id"], name: "by_org", using: :btree

  create_table "name_denorms", force: true do |t|
    t.integer  "org_id"
    t.string   "obj_name"
    t.integer  "obj_id"
    t.integer  "instance_id"
    t.string   "nature_name"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "name_denorms", ["org_id", "obj_id"], name: "by_org_obj_id", using: :btree
  add_index "name_denorms", ["org_id", "obj_name"], name: "by_org_obj_name", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "org_id"
    t.integer  "obj_id"
    t.integer  "instance_id"
    t.integer  "target_obj_id"
    t.integer  "relation_id"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["instance_id"], name: "fk_relationship_data", using: :btree
  add_index "relationships", ["org_id", "instance_id"], name: "by_org_data", using: :btree
  add_index "relationships", ["org_id", "obj_id", "target_obj_id", "relation_id"], name: "by_all", using: :btree

  create_table "unique_fields", force: true do |t|
    t.integer  "org_id"
    t.integer  "obj_id"
    t.string   "field_name"
    t.integer  "instance_id"
    t.string   "value"
    t.integer  "lock_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unique_fields", ["org_id", "obj_id", "field_name"], name: "by_org_obj_field", unique: true, using: :btree

end
