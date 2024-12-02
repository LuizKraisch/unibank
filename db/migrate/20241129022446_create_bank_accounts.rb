# frozen_string_literal: true

class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.integer :account_id
      t.decimal :balance, precision: 8, scale: 2
      t.string :holder
      t.string :status

      t.timestamps
    end
  end
end
