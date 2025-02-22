# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_241_129_022_557) do
  create_table 'bank_accounts', force: :cascade do |t|
    t.integer 'account_id'
    t.decimal 'balance', precision: 8, scale: 2
    t.string 'holder'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.integer 'entity_id'
    t.string 'event_type'
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.integer 'account_id'
    t.string 'transaction_type'
    t.decimal 'amount', precision: 8, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
