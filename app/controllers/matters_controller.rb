class MattersController < ApplicationController
  before_action :authenticate_user!
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
    @company = Company.find(params[:company_id])
    @matter = @company.matters.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  def create
    @matter = Matter.new(matter_params)

    if @matter.save
      redirect_to @matter, notice: 'Matter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /matters/1
  def update
    if @matter.update(matter_params)
      redirect_to @matter, notice: 'Matter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /matters/1
  def destroy
    @matter.destroy
    redirect_to matters_url, notice: 'Matter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def matter_params
      params.require(:matter).permit(:name, :detail, :contact_person)
    end
end
