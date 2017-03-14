require 'rails_helper'


feature 'User finish active contract' do

  scenario 'successfully' do
    equipment = create(:equipment)
    customer = create(:customer)
    contract = create(:contract, equipment: [equipment], customer: customer)

    travel_to Date.parse('2017-01-01') do
      visit contract_path(contract)

      click_on 'Encerrar Contrato'
    end

    visit contract_path(contract)
    expect(page).to have_content 'Contrato Encerrado em: 01/01/2017'

  end


  scenario 'and return to root path' do
    equipment = create(:equipment)
    customer = create(:customer)
    contract = create(:contract, equipment: [equipment], customer: customer)

    visit contract_path(contract)

    click_on 'Encerrar Contrato'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Contrato Encerrado'
  end
end
