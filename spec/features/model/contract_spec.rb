require 'rails_helper'

RSpec.describe Contract, type: :model do
  before do
    @contract = build(:contract, rental_period: 15)

    @category = create(:category)

    @price = create(:price, value: 500, rental_period: 15, category: @category)

    @equipment = create(:equipment, category: @category)

  end

  describe '#calculate_total_value' do
    it 'amount equal to total amount' do
      @contract.equipment << @equipment
      @contract.discount = 0
      @contract.save
      expect(@contract.total_amount).to eq 500.0
    end

    it 'discount value equal amount' do
      @contract.equipment << @equipment
      @contract.discount = 500.0
      @contract.save
      expect(@contract.total_amount).to eq 0
    end

    it 'discount value bigger than total amount' do
      @contract.equipment << @equipment
      @contract.discount = 600.0
      @contract.save
      expect(@contract).not_to be_valid
    end

    it 'operation with two prices, two categories and two equipments' do
      category = create(:category, name: "Brocas")
      price = create(:price, rental_period: 15, value: 250, category: category)
      equipment = create(:equipment, category: category)

      @contract.equipment << @equipment
      @contract.equipment << equipment
      @contract.discount = 0
      @contract.save
      expect(@contract.total_amount).to eq 750.0
    end

    it 'Two prices, one category and one equipment and get the new price' do
      old_price = create(:price, category: @category, rental_period: 10, value: 250)
      new_price = create(:price, category: @category, rental_period: 10, value: 500)

      @contract.equipment << @equipment
      @contract.discount = 0
      @contract.save
      expect(@contract.total_amount).to eq 500
    end
  end
end
