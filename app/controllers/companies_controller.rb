class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  def index
  end

  # GET /companies/1
  def show
    @q_matter = @company.matters.order(updated_at: "DESC").ransack(params[:q])
    @matters = @q_matter.result(distinct: true).page(params[:page])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: '企業情報の作成に成功しました'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: '企業情報の更新に成功しました'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    begin
      @company.destroy
      redirect_to companies_url, notice: '企業情報を削除しました'
    rescue
      redirect_to companies_url, alert: '案件があるため削除に失敗しました'
    end
  end
  
  def search
  end

  def result
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find_by(id: params[:id])
      redirect_to(companies_url, alert: "ERROR!!") if @company.blank?
    end
    
    def set_search
      @q_company = Company.order(:id).ransack(params[:q])
      @companies = @q_company.result(distinct: true).page(params[:page])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:name, :phone_number, :address, :industry)
    end
end
