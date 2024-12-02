# frozen_string_literal: true

class DepositMoneyCommand
  def initialize(account_id, amount)
    @account_id = account_id
    @amount = amount
  end

  def execute
    Event.create!(entity_id: @account_id, event_type: 'money_deposited', data: { amount: @amount })
    account = Read::BankAccount.find_by(account_id: @account_id)
    account.update!(balance: account.balance + @amount)

    Read::Transaction.create!(account_id: @account_id, transaction_type: 'deposit', amount: @amount)
  end
end
