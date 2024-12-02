# frozen_string_literal: true

module Read
  class Transaction < ApplicationRecord
    self.table_name = 'transactions'

    validates :account_id, :transaction_type, :amount, presence: true
    validates :transaction_type, inclusion: %w[deposit withdrawal]
  end
end
