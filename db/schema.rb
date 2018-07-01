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

ActiveRecord::Schema.define(version: 2018_07_01_220101) do

  create_table "empresas", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.decimal "NU_CNPJ", precision: 10
    t.string "NO_RAZAO_SOCIAL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicamentos", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "NU_REGISTRO"
    t.decimal "CO_GGREM", precision: 10
    t.string "CO_EAN"
    t.string "NO_PRODUTO"
    t.integer "TP_PRODUTO"
    t.string "TP_LCCT"
    t.string "ST_REST_HOSP"
    t.string "ST_CAP"
    t.string "ST_CONFAZ87"
    t.integer "NU_PF0_INTEIRO"
    t.integer "NU_PF18_INTEIRO"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.decimal "CPF", precision: 10
    t.string "NOME"
    t.text "ENDERECO"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receitas", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.date "DATA"
    t.text "DESCRICAO"
    t.string "prontidao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secretarias", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ESTADO"
    t.string "MUNICIPIO"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "substancias", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "DS_CAS"
    t.string "DS_SUBSTANCIA"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
