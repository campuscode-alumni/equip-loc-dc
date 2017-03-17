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
    @prices = Price.all
    @equipment = Equipment.all
  end

  def create
    @contract = Contract.new contract_params
    if @contract.save
      redirect_to @contract
    else
      @customers = Customer.all
      @equipment = Equipment.all
      @prices = Price.all
      flash[:error] = "Não foi possível emitir contrato."
      render :new
    end
  end

  private
  def contract_params
    params.require(:contract).permit(
      :customer_id, :delivery_address, :rental_period, :amount, :discount,
      :total_amount, :payment_method, :contact, :start_date, :end_date, equipment_ids: [])
  end
end
