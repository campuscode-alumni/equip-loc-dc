class ReturnReceiptsController < ApplicationController
  def create
    contract = Contract.find(params[:contract_id])
    @receipt = ReturnReceipt.new(return_receipt_params)
    @receipt.date = Date.today
    @receipt.contract = contract
    @receipt.save
    redirect_to @receipt
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
