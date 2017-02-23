require 'rails_helper'

feature 'User issues delivery receipt' do
  scenario 'successfully' do
    contract = Contract.create(customer: 'Rafael',
                            delivery_address: 'Avenida Paulista, 900',
                            equipment: 'Betoneira 1 tonelada',
                            rental_period: '5 dias',
                            amount: 800.00,
                            total_amount: 700.00,
                            discount: 100.00,
                            payment_method: 'à vista',
                            created_at: Time.zone.today,
                            start_date: 7.days.from_now,
                            end_date: 7.days.from_now,
                            contact: 'Sérgio')

    visit contracts_path

    click_on contract.delivery_address

    click_on "Emitir Recibo de Entrega"

    expect(page).to have_content "São Paulo, #{contract.created_at.strftime("%d de %B de %Y")}
    Eu, #{contract.contact}
    em nome da empresa #{contract.customer}. (razão social), inscrita no CNPJ x
    declaro ter recebido os equipamentos #{contract.equipement}
    pelo período de #{contract.rental_period} em perfeitas condições de uso
    no endereço #{contract.delivery_address}.
    de acordo com o contrato #{contract.id}
    emitido no dia #{contract.created_at.strftime("%d /%m/%Y")}.
    ...............................
    (Assinatura do Responsável)"


  end
end
