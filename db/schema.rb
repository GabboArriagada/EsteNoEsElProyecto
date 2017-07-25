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

ActiveRecord::Schema.define(version: 20170725045849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "asignaturas", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "año"
    t.integer  "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_asignaturas_on_curso_id", using: :btree
  end

  create_table "asignaturas_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "asignatura_id"
    t.index ["asignatura_id"], name: "index_asignaturas_users_on_asignatura_id", using: :btree
    t.index ["user_id"], name: "index_asignaturas_users_on_user_id", using: :btree
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "año"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curso_id"], name: "index_cursos_users_on_curso_id", using: :btree
    t.index ["user_id"], name: "index_cursos_users_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notas", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "nota"
    t.integer  "porcentaje"
    t.integer  "user_id"
    t.integer  "asignatura_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["asignatura_id"], name: "index_notas_on_asignatura_id", using: :btree
    t.index ["user_id"], name: "index_notas_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "asignatura_id"
    t.index ["asignatura_id"], name: "index_posts_on_asignatura_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "relation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["relation_id"], name: "index_relationships_on_relation_id", using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "direccion"
    t.string   "rut"
    t.integer  "telefono"
    t.integer  "fecha_ingreso"
    t.string   "sexo"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "last_name"
    t.string   "unconfirmed_email"
    t.date     "fecha_nacimiento"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "asignaturas", "cursos"
  add_foreign_key "asignaturas_users", "asignaturas"
  add_foreign_key "asignaturas_users", "users"
  add_foreign_key "cursos_users", "cursos"
  add_foreign_key "cursos_users", "users"
  add_foreign_key "notas", "asignaturas"
  add_foreign_key "notas", "users"
  add_foreign_key "posts", "asignaturas"
  add_foreign_key "relationships", "users"
end
