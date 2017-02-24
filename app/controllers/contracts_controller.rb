class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @customers = Customer.all
  end

  def create
    @contract = Contract.new contract_params
    @customers = Customer.all
    if @contract.save
      redirect_to @contract
    else
      flash[:error] = "Não foi possível emitir contrato."
      render :new
    end
  end

  private
  def contract_params
    params.require(:contract).permit(
      :customer_id, :delivery_address, :equipment, :rental_period, :amount, :discount,
      :total_amount, :payment_method, :contact
      )
  end
end
