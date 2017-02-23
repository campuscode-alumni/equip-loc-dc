require 'rails_helper'
feature 'User view contract details' do
  scenario 'successfully' do
    contract = Contract.create(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')

    visit contracts_path

    click_on "Avenida Paulista, 900"

    expect(page).to have_css('h2', text: contract.delivery_address)
    expect(page).to have_content contract.customer
    expect(page).to have_content contract.equipment
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.amount
    expect(page).to have_content contract.discount
    expect(page).to have_content contract.total_amount
    expect(page).to have_content contract.payment_method
    expect(page).to have_content contract.contact
  end

  scenario 'and return to contract' do
    contract = Contract.create(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')

    visit contract_path(contract)

    click_on 'Voltar'

    expect(current_path).to eq(contracts_path)                        
  end
end
