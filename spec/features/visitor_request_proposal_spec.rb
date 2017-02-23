require 'rails_helper'
feature 'Visitor request proposal' do
  scenario 'successfully' do
    proposal = Proposal.new(name: 'Alan Batista',
                          email: 'alan@gmail.com',
                          message:'Gostaria de saber os valores de locação
                                  para 2 betoneiras por 5 dias')

    visit root_path

    click_on 'Novo Orçamento'

    fill_in 'Nome', with: 'Alan Batista'
    fill_in 'Email', with: 'alan@gmail.com'
    fill_in 'Mensagem', with: 'Gostaria de saber os valores de locação
                               para 2 betoneiras por 5 dias'

    click_on 'Enviar Solicitação'

    expect(page).to have_content("Solicitação enviada com sucesso")
  end

    scenario 'and should fill all fields' do
      visit new_proposal_path

      click_on 'Enviar Solicitação'

    expect(page).to have_content 'Não foi possível enviar sua solicitação'
    end
end
