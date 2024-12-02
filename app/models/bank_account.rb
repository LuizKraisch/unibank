# frozen_string_literal: true

class BankAccount < ApplicationRecord
  validates :account_id, presence: true

  def deposit(amount)
    raise 'Amount must be positive' if amount <= 0

    Event.create!(entity: id, event_type: 'money_deposited', data: { amount: amount })
  end

  def withdraw(amount)
    raise 'Insufficient funds' if balance < amount

    Event.create!(entity_id: id, event_type: 'money_withdrawn', data: { amount: amount })
  end
end
