# frozen_string_literal: true

module Accounts
  class CommandsController < ApplicationController
    def create
      CreateAccountCommand.new(params[:account_id]).execute
      head :created
    end

    def deposit
      ::DepositMoneyCommand.new(params[:id], params[:amount].to_f).execute
      head :ok
    end

    def withdraw
      ::WithdrawMoneyCommand.new(params[:id], params[:amount].to_f).execute
      head :ok
    end
  end
end
