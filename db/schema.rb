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

ActiveRecord::Schema.define(version: 20130826221057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atribuicaos", force: true do |t|
    t.string   "nome",            null: false
    t.string   "chave",           null: false
    t.integer  "tipoRegistro_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atribuicaos", ["chave"], name: "index_atribuicaos_on_chave", unique: true, using: :btree
  add_index "atribuicaos", ["nome"], name: "index_atribuicaos_on_nome", using: :btree
  add_index "atribuicaos", ["tipoRegistro_id"], name: "index_atribuicaos_on_tipoRegistro_id", using: :btree

  create_table "atribuicaos_cartorios", force: true do |t|
    t.integer "cartorio_id"
    t.integer "atribuicao_id"
  end

  add_index "atribuicaos_cartorios", ["atribuicao_id"], name: "index_atribuicaos_cartorios_on_atribuicao_id", using: :btree
  add_index "atribuicaos_cartorios", ["cartorio_id"], name: "index_atribuicaos_cartorios_on_cartorio_id", using: :btree

  create_table "cartorios", force: true do |t|
    t.integer  "codigo"
    t.string   "nome"
    t.integer  "comarca_id"
    t.integer  "cidade_id"
    t.string   "bairro"
    t.string   "rua"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "cep"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.text     "historico"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "associado",   default: false, null: false
  end

  add_index "cartorios", ["bairro"], name: "index_cartorios_on_bairro", using: :btree
  add_index "cartorios", ["cep"], name: "index_cartorios_on_cep", using: :btree
  add_index "cartorios", ["cidade_id"], name: "index_cartorios_on_cidade_id", using: :btree
  add_index "cartorios", ["codigo"], name: "index_cartorios_on_codigo", unique: true, using: :btree
  add_index "cartorios", ["comarca_id"], name: "index_cartorios_on_comarca_id", using: :btree
  add_index "cartorios", ["historico"], name: "index_cartorios_on_historico", using: :btree
  add_index "cartorios", ["nome"], name: "index_cartorios_on_nome", using: :btree
  add_index "cartorios", ["rua"], name: "index_cartorios_on_rua", using: :btree

  create_table "cidades", force: true do |t|
    t.string   "nome",       null: false
    t.string   "sigla"
    t.integer  "estado_id",  null: false
    t.integer  "comarca_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidades", ["comarca_id"], name: "index_cidades_on_comarca_id", using: :btree
  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree
  add_index "cidades", ["nome"], name: "index_cidades_on_nome", using: :btree
  add_index "cidades", ["sigla"], name: "index_cidades_on_sigla", using: :btree

  create_table "comarcas", force: true do |t|
    t.string   "nome",       null: false
    t.integer  "chave",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comarcas", ["chave"], name: "index_comarcas_on_chave", unique: true, using: :btree
  add_index "comarcas", ["nome"], name: "index_comarcas_on_nome", unique: true, using: :btree

  create_table "estados", force: true do |t|
    t.string   "nome",       null: false
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estados", ["nome"], name: "index_estados_on_nome", unique: true, using: :btree
  add_index "estados", ["sigla"], name: "index_estados_on_sigla", unique: true, using: :btree

  create_table "tipo_registros", force: true do |t|
    t.string   "nome"
    t.string   "chave"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tipo_registros", ["chave"], name: "index_tipo_registros_on_chave", unique: true, using: :btree
  add_index "tipo_registros", ["nome"], name: "index_tipo_registros_on_nome", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
