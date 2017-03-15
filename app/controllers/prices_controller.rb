class PricesController < ApplicationController

  def new
    category = params[:category_id].to_i
    byebug
    @price = Price.new(category_id: category)
    @categories = Category.all

  end

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to @price
    else
      flash[:notice] = 'Não foi possível cadastrar o preço'
      @categories = Category.all
      render :new
    end
  end

  def show
    @price = Price.find(params[:id])
  end

  private

  def price_params
    params.require(:price).permit(:rental_period, :category_id, :value)
  end

end
