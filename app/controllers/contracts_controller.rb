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

  def finish
    @contract = Contract.find(params[:id])
    @contract.finished!
    flash[:notice] = "Contrato Encerrado."
    redirect_to root_path
  end


  private
  def contract_params
    params.require(:contract).permit(
      :customer_id, :delivery_address, :rental_period, :amount, :discount,
      :total_amount, :payment_method, :contact, :start_date, :end_date, :status, equipment_ids: [])
  end
end
