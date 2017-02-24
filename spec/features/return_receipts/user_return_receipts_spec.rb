require 'rails_helper'

feature 'User require return receipt' do
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

    receipt = ReturnReceipt.new(date: Date.today, contract: contract,
                                document: '123456', employee_contact: 'José')

    visit contract_path(contract)

    click_on 'Gerar recibo de devolução'

    fill_in 'Funcionário Responsável', with: receipt.employee_contact
    fill_in 'CPF do Funcionário Responsável', with: receipt.document

    click_on 'Assinar'

    expect(page).to have_content "Eu, #{receipt.contract.contact},
     declaro ter recebido os equipamentos #{receipt.contract.equipment}
     em devolução referente ao contrato #{receipt.contract.id}
     em perfeitas condições da empresa ................,
     inscrita no CNPJ ........... no dia #{receipt.date}.
     Assinatura do Funcionário: #{receipt.employee_contact} - #{receipt.document}"


  end
end
