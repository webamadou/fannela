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

ActiveRecord::Schema.define(version: 2018_09_05_133936) do

  create_table "admin_cities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_admin_cities_on_country_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "code_iso"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.datetime "startdate"
    t.datetime "enddate"
    t.text "description"
    t.text "drive_link"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_events_on_categories_id"
    t.index ["country_id"], name: "index_events_on_country_id"
  end

  create_table "species", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_event", primary_key: "evn_id", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "evn_title", limit: 130, null: false, comment: "nom de l'événement"
    t.datetime "evn_startdate", null: false
    t.datetime "evn_enddate", null: false
    t.string "evn_description", limit: 2000
    t.string "evn_city", limit: 50
    t.string "evn_drive_link", limit: 130, comment: "lien drive de l'événement"
    t.string "evn_state", limit: 2, default: "a", null: false, comment: "Champ pour gèrer la suppression de l'enregistrement (a:active, d:disabled, r:removed)"
    t.timestamp "evn_updated_date", null: false, comment: "date de mise à jour de l'événement"
    t.timestamp "evn_added_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "date d'ajout de l'événement"
    t.integer "cov_id", default: 0
    t.integer "cn_id", null: false
    t.integer "typ_id", null: false
    t.integer "cat_id", null: false
    t.integer "thm_id", null: false
    t.index ["cat_id"], name: "fk_evn_cat_idx"
    t.index ["cn_id"], name: "fk_evn_cn_idx"
    t.index ["cov_id"], name: "fk_evn_cov_idx"
    t.index ["thm_id"], name: "fk_evn_thm_idx"
    t.index ["typ_id"], name: "fk_evn_typ_idx"
  end

  create_table "t_thematic", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "state", limit: 2, null: false, comment: "gèrer la suppression de l'enregistrement.Valeurs possibles (a:active, d:disabled, r:removed)"
  end

  create_table "t_type_event", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "state", limit: 2, null: false, comment: "Champ pour gèrer la suppression de l'enregistrement (a:active, d:disabled, r:removed)"
    t.integer "category_id", null: false
    t.index ["category_id"], name: "fk_typ_cat_idx"
  end

  create_table "themes", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "state", default: 0
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_themes_on_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "firstname"
    t.string "name"
    t.string "office"
    t.string "rol"
    t.string "salt"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "state", default: 0
    t.integer "connected"
    t.timestamp "last_seen", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "facebook_id"
    t.string "google_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "admin_cities", "countries"
  add_foreign_key "events", "categories", column: "categories_id"
  add_foreign_key "events", "countries"
end
