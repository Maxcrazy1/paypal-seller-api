# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_18_113710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_admins_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_admins_on_resource"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_customers_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_customers_on_resource"
  end

  create_table "description_templates", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_description_templates_on_user_id"
  end

  create_table "operation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_number"
    t.decimal "price"
    t.boolean "visible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.float "maximum_price"
    t.float "minimum_price"
    t.bigint "operation_type_id", null: false
    t.bigint "description_template_id"
    t.index ["description_template_id"], name: "index_orders_on_description_template_id"
    t.index ["operation_type_id"], name: "index_orders_on_operation_type_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_admins", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_users_admins_on_admin_id"
    t.index ["user_id", "admin_id"], name: "index_users_admins_on_user_id_and_admin_id"
    t.index ["user_id"], name: "index_users_admins_on_user_id"
  end

  create_table "users_customers", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_users_customers_on_customer_id"
    t.index ["user_id", "customer_id"], name: "index_users_customers_on_user_id_and_customer_id"
    t.index ["user_id"], name: "index_users_customers_on_user_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "bank_accounts", "users"
  add_foreign_key "orders", "description_templates"
  add_foreign_key "orders", "operation_types"
  add_foreign_key "orders", "users"
end
