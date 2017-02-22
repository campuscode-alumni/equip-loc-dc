class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    end
  end

  def show
    @customer = Customer.find params[:id]
  end

  def customer_params
    params.require(:customer).permit(:name, :legal_name, :customer_type,
                                      :contact_name, :phone_number,
                                      :email, :address, :document)
    #code
  end
end
