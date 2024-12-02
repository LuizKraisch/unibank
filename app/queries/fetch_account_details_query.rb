# frozen_string_literal: true

class FetchAccountDetailsQuery
  def initialize(account_id)
    @account_id = account_id
  end

  def execute
    account = Read::BankAccount.find_by(account_id: @account_id)
    transactions = Read::Transaction.where(account_id: @account_id).order(:created_at)
    { account: account, transactions: transactions }
  end
end
