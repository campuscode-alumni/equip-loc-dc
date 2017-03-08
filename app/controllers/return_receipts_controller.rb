class ReturnReceiptsController < ApplicationController
  def create
    @contract = Contract.find(params[:contract_id])
    @receipt = ReturnReceipt.new(return_receipt_params)
    @receipt.date = Date.today
    @receipt.contract = @contract
    if @receipt.save
      redirect_to @receipt
    else
      flash[:notice] = 'Não foi possível gerar o recibo de devolução'
      render :new
    end
  end

  def show
    @receipt = ReturnReceipt.find(params[:id])
  end

  def new
    @contract = Contract.find(params[:contract_id])
    @receipt = ReturnReceipt.new
  end

  private

  def return_receipt_params
    params.require(:return_receipt).permit(:document, :employee_contact)
  end
end
