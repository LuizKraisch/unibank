# frozen_string_literal: true

module Accounts
  class QueriesController < ApplicationController
    def show
      result = FetchAccountDetailsQuery.new(params[:account_id]).execute
      render json: result
    end
  end
end
