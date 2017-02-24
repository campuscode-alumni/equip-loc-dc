class DeliveryReceiptsController < ApplicationController
  def create
    @contract = Contract.find(params[:contract_id])
    @contract.delivery_receipt = DeliveryReceipt.new(issue_date: Time.zone.today)
    @contract.delivery_receipt.save
    redirect_to @contract.delivery_receipt
  end
  def show
    @delivery_receipt = DeliveryReceipt.find(params[:id])
  end
end
