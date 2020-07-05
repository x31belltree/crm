class MattersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_matter, only: [:show, :edit, :update, :destroy]

  # GET /matters
  def index
    @matters = Matter.all
  end

  # GET /matters/1
  def show
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
    @matter = Matter.new(matter_params)

    if @matter.save
      @status = true
      redirect_to @company, notice: 'matter was successfully created.'
    else
      @status = false
    end
  end

  # PATCH/PUT /matters/1
  def update
    if @matter.update(matter_params)
      @status = true
      redirect_to @company, notice: 'matter was successfully updated.'
    else
      @status = false
    end
  end

  # DELETE /matters/1
  def destroy
    @matter.destroy
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

    def matter_params
      params.require(:matter).permit(:name, :detail, :contact_person, :company_id)
    end
end
