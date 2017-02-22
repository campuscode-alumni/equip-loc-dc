class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new contract_params
    if @contract.save
      redirect_to @contract
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private
  def contract_params
    params.require(:contract).permit(
      :customer, :delivery_address, :equipment, :rental_period, :amount, :discount,
      :total_amount, :payment_method, :contact
      )
  end
end
