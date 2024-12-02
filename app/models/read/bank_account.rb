# frozen_string_literal: true

module Read
  class BankAccount < ApplicationRecord
    self.table_name = 'bank_accounts'

    validates :account_id, :balance, presence: true
  end
end
