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

ActiveRecord::Schema.define(version: 20170515023757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.decimal  "valor"
    t.string   "sitiacao"
    t.integer  "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_accounts_on_pessoa_id", using: :btree
  end

  create_table "conta_eventos", force: :cascade do |t|
    t.integer  "pessoa_id"
    t.integer  "evento_id"
    t.boolean  "em_aberto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_conta_eventos_on_evento_id", using: :btree
    t.index ["pessoa_id"], name: "index_conta_eventos_on_pessoa_id", using: :btree
  end

  create_table "equipes", force: :cascade do |t|
    t.string   "nome"
    t.string   "tipo"
    t.datetime "dtCadastro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "quantidade_de_vagas"
    t.date     "data_de_inicio"
    t.date     "data_de_fim"
    t.integer  "tipo_evento_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["tipo_evento_id"], name: "index_eventos_on_tipo_evento_id", using: :btree
  end

  create_table "pagamentos", force: :cascade do |t|
    t.date     "data"
    t.integer  "conta_evento_id"
    t.decimal  "valor",              default: "0.0"
    t.decimal  "desconto",           default: "0.0"
    t.string   "forma_de_pagamento"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["conta_evento_id"], name: "index_pagamentos_on_conta_evento_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.string   "obs"
    t.integer  "conta_evento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conta_evento_id"], name: "index_pedidos_on_conta_evento_id", using: :btree
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "cpf"
    t.string   "nome"
    t.string   "sexo"
    t.date     "dtNasc"
    t.string   "logradouro"
    t.string   "cep"
    t.string   "bairro"
    t.string   "email"
    t.string   "telefone"
    t.boolean  "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produto_pedidos", force: :cascade do |t|
    t.integer  "pedido_id"
    t.integer  "produto_id"
    t.integer  "quantidade", default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["pedido_id"], name: "index_produto_pedidos_on_pedido_id", using: :btree
    t.index ["produto_id"], name: "index_produto_pedidos_on_produto_id", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "preco"
    t.boolean  "ativo"
    t.string   "obs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_eventos", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "ativo"
    t.datetime "dtCadastro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "pessoa_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["pessoa_id"], name: "index_users_on_pessoa_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accounts", "pessoas"
  add_foreign_key "conta_eventos", "eventos"
  add_foreign_key "conta_eventos", "pessoas"
  add_foreign_key "eventos", "tipo_eventos"
  add_foreign_key "pagamentos", "conta_eventos"
  add_foreign_key "pedidos", "conta_eventos"
  add_foreign_key "produto_pedidos", "pedidos"
  add_foreign_key "produto_pedidos", "produtos"
  add_foreign_key "users", "pessoas"
end
