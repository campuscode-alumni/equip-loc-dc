class WelcomeController < ApplicationController
  def index
    @contracts = Contract.where(end_date: Date.today..(Date.today + 2.days))
  end

end
