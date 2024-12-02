# frozen_string_literal: true

class CreateAccountCommand
  def initialize(account_id)
    @account_id = account_id
  end

  def execute
    Event.create!(entity_id: @account_id, event_type: 'account_created', data: {})
    Read::BankAccount.create!(account_id: @account_id, balance: 0)
  end
end
