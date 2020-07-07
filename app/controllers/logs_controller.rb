class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_matter
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  def index
    @logs = @matter.logs.all
  end

  # GET /logs/1
  def show
  end

  # GET /logs/new
  def new
    @log = @matter.logs.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  def create
    @log = @matter.logs.new(log_params)

    if @log.save
      @status = true
      redirect_to company_matter_path(id: @matter.id), notice: 'ログの登録に成功しました'
    else
      @status = false
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @matter.logs.update(log_params)
      @status = true 
      redirect_to company_matter_path(id: @matter.id), notice: 'ログの更新に成功しました'
    else
      @status = false
    end
  end

  # DELETE /logs/1
  def destroy
    @log.destroy
    redirect_to company_matter_path(id: @matter.id), notice: 'ログを削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_company
      @company = Company.find_by(id: params[:company_id])
      redirect_to(company_url, alert: "ERROR!!") if @company.blank?
    end
    
    def set_matter
      @matter = @company.matters.find_by(id: params[:matter_id])
      redirect_to(company_matter_url, alert: "ERROR!!") if @matter.blank?
    end
    
    def set_log
      @log = @matter.logs.find_by(id: params[:id])
    end

    def log_params
      params.require(:log).permit(:next_approach_date, :status, :comment, :matter_id)
    end
end
