class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new contract_params
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
      :customer, :delivery_address, :equipment, :rental_period, :amount, :discount,
      :total_amount, :payment_method, :contact
      )
  end
end
