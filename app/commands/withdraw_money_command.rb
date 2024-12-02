# frozen_string_literal: true

class WithdrawMoneyCommand
  def initialize(account_id, amount)
    @account_id = account_id
    @amount = amount
  end

  def execute
    account = Read::BankAccount.find_by(account_id: @account_id)
    raise 'Insufficient funds' if account.balance < @amount

    Event.create!(entity_id: @account_id, event_type: 'money_withdrawn', data: { amount: @amount })
    account.update!(balance: account.balance - @amount)

    Read::Transaction.create!(account_id: @account_id, transaction_type: 'withdrawal', amount: @amount)
  end
end
