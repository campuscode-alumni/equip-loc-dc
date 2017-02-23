class ProposalsController < ApplicationController
  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new proposal_params
    if @proposal.save
      flash[:success] = "Solicitação enviada com sucesso"
      redirect_to root_path
    else
      flash[:error] = "Não foi possível enviar sua solicitação"
      render :new
    end
  end

private
  def proposal_params
    params.require(:proposal).permit(:name, :email, :message)
  end
end
