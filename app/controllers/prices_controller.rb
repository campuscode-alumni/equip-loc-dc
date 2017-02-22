class PricesController < ApplicationController

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to @price
    else
      flash[:notice] = 'Não foi possível cadastrar o preço'
      render :new
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:rental_period, :category, :value)
  end

end
