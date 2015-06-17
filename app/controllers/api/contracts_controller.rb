class Api::ContractsController < ApplicationController
  before_filter :set_contract, only: [:update, :destroy, :show]

  def index
    # @contracts = current_user.department.nil? ? Contract.all : Contract.where(department: current_user.department)
    @contracts = Contract.all
    render json: @contracts
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.department = current_user.department
    if @contract.save
      render json: @contract, status: :created, contract: [:api, @contract]
    else
      render json: { errors: @contract.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @contract.update(contract_params)
      head :no_content
    else
      render json: { errors: @contract.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @contract.destroy

    head :no_content
  end

  def show
    render json: @contract
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:requisition_number, :contract_number, :award_effective_date, :order_number, :solicitation_number, :solicitation_issue_date, :for_solicitation_call,
    :name, :telephone_number, :offer_due_date, :issued_by, :issue_code, :acquisition, :delivery_for_fob, :discount_terms, :contract_order_under_dpas,
    :rating, :method_of_solicititation, :deliver_to, :delivery_code, :administered_by, :administered_code, :contractor, :contractor_code,
    :payment_will_be_made, :payment_will_be_made_code, :facility_code, :remittance_difference, :submit_invoices_to_address, :accounting_data,
    :total_award_amount, :solicitation_addenda, :contract_addenda, :contractor_required_to_sign, :award_of_contract, :signatories, :signatories_co,
    :date_signed, :name_signer, :date_signer_signed, :type_of_print, :department )
  end
end
