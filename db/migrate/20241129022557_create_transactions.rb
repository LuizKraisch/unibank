# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.string :transaction_type
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
