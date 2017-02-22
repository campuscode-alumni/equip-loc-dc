require 'rails_helper'

feature  'User issues contract' do
  scenario 'successfully' do
    contract = Contract.new(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            contact: 'Sérgio')

    visit new_contract_path

    fill_in 'Cliente',                with: contract.customer
    fill_in 'Endereço de Entrega',    with: contract.delivery_address
    fill_in 'Equipamento',    with: contract.equipment
    fill_in 'Prazo de Locação', with: contract.rental_period
    fill_in 'Valor',            with: contract.amount
    fill_in 'Desconto',         with: contract.discount
    fill_in 'Valor Total',      with: contract.total_amount
    fill_in 'Forma de Pagamento', with: contract.payment_method
    fill_in 'Responsável',        with: contract.contact

    click_on 'Emitir Contrato'

    expect(page).to have_content "Cliente #{contract.customer}"
    expect(page).to have_content "Endereço de Entrega #{contract.delivery_address}"
    expect(page).to have_content "Equipamento #{contract.equipment}"
    expect(page).to have_content "Prazo de Locação #{contract.rental_period}"
    expect(page).to have_content "Valor #{contract.amount}"
    expect(page).to have_content "Desconto #{contract.discount}"
    expect(page).to have_content "Valor Total #{contract.total_amount}"
    expect(page).to have_content "Forma de Pagamento #{contract.payment_method}"
    expect(page).to have_content "Responsável #{contract.contact}"
  end
end
