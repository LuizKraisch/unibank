# frozen_string_literal: true

class Event < ApplicationRecord
  validates :event_type, presence: true

  # Reconstruct state by replaying events
  def self.replay(account_id)
    account = { id: nil, balance: 0 }
    events = where(entity_id: account_id).order(:created_at)

    events.each do |event|
      case event.event_type
      when 'account_created'
        account[:id] = event.entity_id
      when 'money_deposited'
        account[:balance] += event.data['amount']
      when 'money_withdrawn'
        account[:balance] -= event.data['amount']
      end
    end

    account
  end
end
