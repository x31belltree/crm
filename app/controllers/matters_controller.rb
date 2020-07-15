class MattersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_search
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  # GET /matters
  def index
  end

  # GET /matters/1
  def show
    @q_log = @matter.logs.order(updated_at: "DESC").ransack(params[:q])
    @logs = @q_log.result(distinct: true).page(params[:page])
  end

  # GET /matters/new
  def new
    @matter = @company.matters.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  def create
    @matter = @company.matters.new(matter_params)

    if @matter.save
      redirect_to company_path(id: @company.id), notice: '案件の作成に成功しました'
    else
      render :new
    end
  end

  # PATCH/PUT /matters/1
  def update
    if @matter.update(matter_params)
      redirect_to company_path(id: @company.id), notice: '案件の更新に成功しました'
    else
      render :edit
    end
  end

  # DELETE /matters/1
  def destroy
    @matter.destroy
    redirect_to company_path(id: @company.id), notice: '案件を削除しました'
  end
  
  def search
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find_by(id: params[:company_id])
      redirect_to(company_url, alert: "ERROR!!") if @company.blank?
    end
    
    def set_matter
      @matter = @company.matters.find_by(id: params[:id])
    end
    
    def set_search
      @q_matter = @company.matters.order(updated_at: "DESC").ransack(params[:q])
      @matters = @q_matter.result(distinct: true).page(params[:page])
    end

    def matter_params
      params.require(:matter).permit(:name, :detail, :contact_person, :company_id)
    end
end
