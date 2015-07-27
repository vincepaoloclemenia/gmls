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

ActiveRecord::Schema.define(version: 20150724070754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "categories", ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree

  create_table "contract_items", force: :cascade do |t|
    t.integer  "contract_id"
    t.string   "item_no"
    t.text     "schedule_of_supplies"
    t.integer  "quantity"
    t.string   "unit"
    t.decimal  "unit_price"
    t.decimal  "amount"
    t.integer  "department"
    t.datetime "deleted_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "contract_items", ["deleted_at"], name: "index_contract_items_on_deleted_at", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.string   "requisition_number"
    t.string   "contract_number"
    t.datetime "award_effective_date"
    t.string   "order_number"
    t.string   "solicitation_number"
    t.datetime "solicitation_issue_date"
    t.string   "for_solicitation_call"
    t.string   "name"
    t.string   "telephone_number"
    t.datetime "offer_due_date"
    t.text     "issued_by"
    t.string   "issue_code"
    t.string   "acquisition"
    t.boolean  "delivery_for_fob"
    t.string   "discount_terms"
    t.boolean  "contract_order_under_dpas"
    t.string   "rating"
    t.boolean  "method_of_solicititation"
    t.text     "deliver_to"
    t.string   "delivery_code"
    t.text     "administered_by"
    t.string   "administered_code"
    t.text     "contractor"
    t.string   "contractor_code"
    t.text     "payment_will_be_made"
    t.string   "payment_will_be_made_code"
    t.string   "facility_code"
    t.boolean  "remittance_difference"
    t.boolean  "submit_invoices_to_address"
    t.text     "accounting_data"
    t.decimal  "total_award_amount"
    t.boolean  "solicitation_addenda"
    t.boolean  "contract_addenda"
    t.boolean  "contractor_required_to_sign"
    t.boolean  "award_of_contract"
    t.string   "signatories"
    t.string   "signatories_co"
    t.datetime "date_signed"
    t.string   "name_signer"
    t.datetime "date_signer_signed"
    t.text     "type_of_print"
    t.integer  "department"
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "contracts", ["deleted_at"], name: "index_contracts_on_deleted_at", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_no"
    t.string   "employer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "department"
  end

  add_index "employees", ["role_id"], name: "index_employees_on_role_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "owner_contact_person"
    t.string   "mobile_no"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "government_agencies", force: :cascade do |t|
    t.string   "department_or_division"
    t.string   "contact_person"
    t.string   "mobile_number"
    t.string   "telephone"
    t.string   "fax"
    t.string   "email"
    t.text     "address"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "government_agencies", ["deleted_at"], name: "index_government_agencies_on_deleted_at", using: :btree

  create_table "incidental_items", force: :cascade do |t|
    t.integer  "incidental_quote_id"
    t.integer  "item_id"
    t.string   "area"
    t.decimal  "price"
    t.text     "remarks"
    t.integer  "department"
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "supplier_pricing_detail_id"
    t.integer  "supplier_id"
    t.integer  "location_id"
    t.string   "quantity"
    t.string   "unit"
    t.string   "tariff_code"
  end

  add_index "incidental_items", ["deleted_at"], name: "index_incidental_items_on_deleted_at", using: :btree

  create_table "incidental_quotes", force: :cascade do |t|
    t.string   "quotation_no"
    t.string   "company"
    t.text     "address"
    t.string   "subject"
    t.text     "subject_detail"
    t.text     "terms_and_condition"
    t.text     "validity"
    t.string   "prepared_by"
    t.datetime "deleted_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "department"
    t.integer  "logreq_id"
  end

  add_index "incidental_quotes", ["deleted_at"], name: "index_incidental_quotes_on_deleted_at", using: :btree

  create_table "item_location_prices", force: :cascade do |t|
    t.integer  "item_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "origin"
    t.string   "destination"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "item_prices", force: :cascade do |t|
    t.integer  "item_id"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "item_prices", ["deleted_at"], name: "index_item_prices_on_deleted_at", using: :btree
  add_index "item_prices", ["item_id"], name: "index_item_prices_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.string   "package_size"
    t.string   "unit_of_issue"
    t.decimal  "unit_price"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "item_type"
    t.decimal  "rate",            precision: 8, scale: 2
    t.text     "description"
    t.string   "service_type"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at", using: :btree
  add_index "items", ["sub_category_id"], name: "index_items_on_sub_category_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location_type"
    t.string   "region"
    t.text     "address"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "locations", ["deleted_at"], name: "index_locations_on_deleted_at", using: :btree

  create_table "logreq_items", force: :cascade do |t|
    t.integer  "item_id"
    t.text     "description"
    t.integer  "quantity"
    t.string   "unit"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "days"
    t.decimal  "unit_price",  precision: 8, scale: 2
    t.decimal  "total_price", precision: 8, scale: 2
    t.integer  "logreq_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "logreq_responses", force: :cascade do |t|
    t.integer  "logreq_id"
    t.text     "question"
    t.text     "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "logreqs", force: :cascade do |t|
    t.date     "entry_date"
    t.text     "information"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logreq_responses"
    t.string   "shipname"
    t.datetime "deleted_at"
    t.integer  "department"
    t.text     "logreg_info"
    t.integer  "vessel_id"
    t.string   "vessel_class_name"
    t.datetime "date_of_arrival"
    t.datetime "date_of_departure"
    t.string   "pier"
    t.integer  "user_id"
    t.text     "ending_text"
    t.integer  "principal_id"
  end

  add_index "logreqs", ["deleted_at"], name: "index_logreqs_on_deleted_at", using: :btree

  create_table "navy_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "department"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "navy_types", ["deleted_at"], name: "index_navy_types_on_deleted_at", using: :btree

  create_table "prepservices", force: :cascade do |t|
    t.string   "vessel_name"
    t.string   "voy_no"
    t.string   "registry_no"
    t.string   "flag"
    t.string   "call_sign"
    t.string   "master"
    t.string   "operator"
    t.string   "regular_grt"
    t.string   "regular_nwt"
    t.string   "dwt"
    t.string   "beam"
    t.string   "loa"
    t.integer  "year_built"
    t.string   "type_of_crane"
    t.string   "crane_capacity"
    t.string   "crane_hook_cycle"
    t.string   "no_of_hatches"
    t.string   "type_of_hatch_cover"
    t.string   "draft_fwd"
    t.string   "draft_aft"
    t.string   "type"
    t.string   "services_required"
    t.string   "discharging_term"
    t.string   "dangerous_cargo"
    t.string   "cargo_rse"
    t.string   "berthing_preference"
    t.string   "docking_side"
    t.string   "representative"
    t.string   "ship_agent"
    t.string   "address"
    t.string   "tel_no"
    t.string   "tug_assistance"
    t.string   "enclosure"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.date     "entry_date"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "prepservices", ["deleted_at"], name: "index_prepservices_on_deleted_at", using: :btree

  create_table "principals", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "address"
    t.string   "point_of_contact"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "principals", ["deleted_at"], name: "index_principals_on_deleted_at", using: :btree

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.string   "uom"
    t.decimal  "unit_price"
    t.decimal  "discount"
    t.decimal  "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "purchase_order_items", ["item_id"], name: "index_purchase_order_items_on_item_id", using: :btree
  add_index "purchase_order_items", ["purchase_order_id"], name: "index_purchase_order_items_on_purchase_order_id", using: :btree

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "attention"
    t.date     "date_created"
    t.date     "delivery_date"
    t.string   "payment_terms"
    t.text     "remarks"
    t.string   "deliver_to"
    t.integer  "prepared_by"
    t.string   "purchase_order_number"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "rfq_id"
    t.integer  "department"
    t.integer  "incidental_quote_id"
    t.string   "status",                default: "Ordered"
    t.integer  "tag_by_assigned_user"
  end

  add_index "purchase_orders", ["rfq_id"], name: "index_purchase_orders_on_rfq_id", using: :btree
  add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id", using: :btree

  create_table "quality_questionnaires", force: :cascade do |t|
    t.string   "port"
    t.string   "vessel_name"
    t.date     "port_visit_date"
    t.string   "field_prior_to_arrival"
    t.string   "field_upon_arrival"
    t.string   "field_during_the_port_call"
    t.string   "field_overall"
    t.text     "comments"
    t.string   "field_name"
    t.string   "field_signature"
    t.string   "field_date_signed"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "quality_questionnaires", ["deleted_at"], name: "index_quality_questionnaires_on_deleted_at", using: :btree

  create_table "questionnaire_criteria", force: :cascade do |t|
    t.integer  "quality_questionnaire_id"
    t.string   "criteria_title"
    t.text     "criteria_description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.datetime "deleted_at"
  end

  add_index "questionnaire_criteria", ["deleted_at"], name: "index_questionnaire_criteria_on_deleted_at", using: :btree
  add_index "questionnaire_criteria", ["quality_questionnaire_id"], name: "index_questionnaire_criteria_on_quality_questionnaire_id", using: :btree

  create_table "rfq_items", force: :cascade do |t|
    t.integer  "item_id"
    t.text     "description"
    t.integer  "quantity"
    t.string   "ui"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "days"
    t.decimal  "unit_price",             precision: 8, scale: 2
    t.decimal  "total_price",            precision: 8, scale: 2
    t.integer  "rfq_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.datetime "deleted_at"
    t.integer  "department"
    t.integer  "item_location_price_id"
  end

  add_index "rfq_items", ["deleted_at"], name: "index_rfq_items_on_deleted_at", using: :btree
  add_index "rfq_items", ["item_id"], name: "index_rfq_items_on_item_id", using: :btree
  add_index "rfq_items", ["item_location_price_id"], name: "index_rfq_items_on_item_location_price_id", using: :btree
  add_index "rfq_items", ["rfq_id"], name: "index_rfq_items_on_rfq_id", using: :btree

  create_table "rfq_supplier_items", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "item_id"
    t.integer  "rfq_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "is_approved",                         default: false
    t.boolean  "is_rejected",                         default: false
  end

  add_index "rfq_supplier_items", ["item_id"], name: "index_rfq_supplier_items_on_item_id", using: :btree
  add_index "rfq_supplier_items", ["rfq_id"], name: "index_rfq_supplier_items_on_rfq_id", using: :btree
  add_index "rfq_supplier_items", ["supplier_id"], name: "index_rfq_supplier_items_on_supplier_id", using: :btree

  create_table "rfqs", force: :cascade do |t|
    t.string   "title"
    t.integer  "principal_id"
    t.string   "duns"
    t.string   "cage_code"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "step"
    t.string   "sub_step"
    t.datetime "deleted_at"
    t.integer  "department"
    t.boolean  "is_awarded",              default: false
    t.integer  "monitoring_officer_id"
    t.integer  "requirements_officer_id"
  end

  add_index "rfqs", ["deleted_at"], name: "index_rfqs_on_deleted_at", using: :btree
  add_index "rfqs", ["monitoring_officer_id"], name: "index_rfqs_on_monitoring_officer_id", using: :btree
  add_index "rfqs", ["principal_id"], name: "index_rfqs_on_principal_id", using: :btree
  add_index "rfqs", ["requirements_officer_id"], name: "index_rfqs_on_requirements_officer_id", using: :btree

  create_table "role_managements", force: :cascade do |t|
    t.integer  "role_id"
    t.string   "module_name"
    t.boolean  "can_create"
    t.boolean  "can_delete"
    t.boolean  "can_edit"
    t.boolean  "can_view"
    t.integer  "department"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "roles", ["deleted_at"], name: "index_roles_on_deleted_at", using: :btree

  create_table "service_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "mobile_number"
    t.string   "telephone"
    t.string   "fax"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "service_providers", ["deleted_at"], name: "index_service_providers_on_deleted_at", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "services", ["deleted_at"], name: "index_services_on_deleted_at", using: :btree

  create_table "ship_arrivals", force: :cascade do |t|
    t.integer  "vessel_id"
    t.date     "date_arriving"
    t.string   "time_arriving"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "vessel_class_id"
    t.integer  "vessel_type_id"
    t.string   "shipname"
    t.date     "date_assigned"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "ship_arrivals", ["deleted_at"], name: "index_ship_arrivals_on_deleted_at", using: :btree
  add_index "ship_arrivals", ["vessel_class_id"], name: "index_ship_arrivals_on_vessel_class_id", using: :btree
  add_index "ship_arrivals", ["vessel_id"], name: "index_ship_arrivals_on_vessel_id", using: :btree
  add_index "ship_arrivals", ["vessel_type_id"], name: "index_ship_arrivals_on_vessel_type_id", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  add_index "sub_categories", ["deleted_at"], name: "index_sub_categories_on_deleted_at", using: :btree

  create_table "supplier_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_items", force: :cascade do |t|
    t.integer  "supplier_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "item_id"
    t.text     "remarks"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "supplier_items", ["deleted_at"], name: "index_supplier_items_on_deleted_at", using: :btree
  add_index "supplier_items", ["item_id"], name: "index_supplier_items_on_item_id", using: :btree
  add_index "supplier_items", ["supplier_id"], name: "index_supplier_items_on_supplier_id", using: :btree

  create_table "supplier_pricing_details", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "service_id"
    t.integer  "item_id"
    t.integer  "tool_id"
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "unit"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "type_name"
    t.string   "service_type"
    t.integer  "quantity"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "mobile_number"
    t.string   "telephone_number"
    t.string   "fax_number"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.datetime "deleted_at"
    t.integer  "department"
    t.integer  "supplier_category_id"
    t.integer  "location_id"
  end

  add_index "suppliers", ["deleted_at"], name: "index_suppliers_on_deleted_at", using: :btree
  add_index "suppliers", ["location_id"], name: "index_suppliers_on_location_id", using: :btree
  add_index "suppliers", ["supplier_category_id"], name: "index_suppliers_on_supplier_category_id", using: :btree

  create_table "tools", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "department"
    t.text     "description"
    t.decimal  "price_per_unit"
    t.integer  "supplier_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.integer  "age"
    t.string   "gender"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "mobile_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "department"
    t.string   "plate_number"
    t.integer  "employer_id"
    t.string   "vehicle_type"
    t.integer  "driver_id"
  end

  create_table "vessel_classes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "vessel_classes", ["deleted_at"], name: "index_vessel_classes_on_deleted_at", using: :btree

  create_table "vessel_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "vessel_class_id"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "draft"
    t.string   "length"
    t.string   "beam"
    t.string   "displacement"
    t.integer  "crew_count"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "vessel_types", ["deleted_at"], name: "index_vessel_types_on_deleted_at", using: :btree
  add_index "vessel_types", ["vessel_class_id"], name: "index_vessel_types_on_vessel_class_id", using: :btree

  create_table "vessels", force: :cascade do |t|
    t.string   "name"
    t.integer  "vessel_class_id"
    t.integer  "vessel_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "flag_of_registry"
    t.string   "owner_operator"
    t.string   "grt"
    t.string   "dwt"
    t.string   "loa"
    t.string   "service_speed"
    t.string   "conference"
    t.integer  "type"
    t.string   "type_of_service"
    t.integer  "num_of_booms"
    t.string   "capacity_boom"
    t.string   "type_of_boom"
    t.integer  "num_of_hatches"
    t.string   "type_of_hatch"
    t.string   "boom_cycle"
    t.string   "customs_reg_number"
    t.string   "voyage_num"
    t.string   "nrt"
    t.datetime "deleted_at"
    t.integer  "department"
  end

  add_index "vessels", ["deleted_at"], name: "index_vessels_on_deleted_at", using: :btree
  add_index "vessels", ["vessel_class_id"], name: "index_vessels_on_vessel_class_id", using: :btree
  add_index "vessels", ["vessel_type_id"], name: "index_vessels_on_vessel_type_id", using: :btree

end
