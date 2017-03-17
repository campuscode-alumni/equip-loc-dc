require 'rails_helper'

feature 'User require return receipt' do
  scenario 'successfully' do

    equipment = create(:equipment)
    contract = create(:contract, amount: 500, total_amount: 500)

    contract.equipment << equipment
    contract.delivery_receipt = DeliveryReceipt.create(issue_date: Time.zone.today)

    receipt = build(:return_receipt, contract: contract)

    visit contract_path(contract)

    click_on 'Gerar recibo de devolução'

    fill_in 'Funcionário Responsável', with: receipt.employee_contact
    fill_in 'CPF do Funcionário Responsável', with: receipt.document

    click_on 'Assinar'

    expect(page).to have_content "Eu, #{receipt.contract.contact},
     declaro ter recebido os equipamentos #{equipment.name}
     em devolução referente ao contrato #{receipt.contract.id}
     em perfeitas condições da empresa ................,
     inscrita no CNPJ ........... no dia #{receipt.date}.
     Assinatura do Funcionário: #{receipt.employee_contact} - #{receipt.document}"

  end

  scenario 'with invalid data' do

    contract = create(:contract, amount:500, total_amount: 500)

    contract.delivery_receipt = DeliveryReceipt.create(issue_date: Time.zone.today)

    visit contract_path(contract)

    click_on 'Gerar recibo de devolução'

    click_on 'Assinar'

    expect(page).to have_content 'Não foi possível gerar o recibo de devolução'
  end

  scenario 'Without delivery receipt' do
    equipment = create(:equipment)
    contract = create(:contract, amount:500, total_amount: 500)

    contract.equipment << equipment

    visit contract_path(contract)

    expect(page).not_to have_content 'Gerar recibo de devolução'
  end

  scenario 'Second way of receipt' do
    equipment = create(:equipment)
    contract = create(:contract, amount:500, total_amount: 500)

    contract.equipment << equipment

    contract.delivery_receipt = DeliveryReceipt.create(issue_date: Time.zone.today)

    receipt = create(:return_receipt, contract: contract)

    visit contract_path(contract)

    click_on 'Reimpressão de Recibo de Devolução'

    expect(page).to have_content "Eu, #{receipt.contract.contact},
     declaro ter recebido os equipamentos #{equipment.name}
     em devolução referente ao contrato #{receipt.contract.id}
     em perfeitas condições da empresa ................,
     inscrita no CNPJ ........... no dia #{receipt.date}.
     Assinatura do Funcionário: #{receipt.employee_contact} - #{receipt.document}"

  end
end
