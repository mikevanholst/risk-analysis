class RisksController < ApplicationController
  before_action :set_risk, only: [:show, :edit, :update, :destroy]

  # GET /risks
  # GET /risks.json
  def index
    @risks = Risk.all
    @categories = Category.all

  end

  # GET /risks/1
  # GET /risks/1.json
  def show
  end

  # GET /risks/new
  def new
    @risk = Risk.new
    @category_id = params[:category_id]
    @category = Category.find_by_id(@category_id.to_i)
  end

  # GET /risks/1/edit
  def edit
  end

  def legend
  end

  # POST /risks
  # POST /risks.json
  def create
    @categories = Category.all
    @risk = Risk.new(risk_params)
    # @category_id = params[:category_id]
    # @category = Category.find_by_id(@category_id.to_i)
    # @category = Category.find_by_id(params[:category_id])
    # @risk.category_id = @category_id
    # @risk.category_id = @category.id
    # @risk.category = @category
    
    respond_to do |format|
      if @risk.save
        # format.html { redirect_to @risk, notice: 'Risk was successfully created.' }
        format.html { redirect_to risks_path, notice: 'Risk was successfully created.' }
        format.json { render :show, status: :created, location: @risk }
      else
        # format.html { render :new }
        format.html { render :risks }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risks/1
  # PATCH/PUT /risks/1.json
  def update
    respond_to do |format|
      if @risk.update(risk_params)
        format.html { redirect_to @risk, notice: 'Risk was successfully updated.' }
        format.json { render :show, status: :ok, location: @risk }
      else
        format.html { render :edit }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risks/1
  # DELETE /risks/1.json
  def destroy
    @risk.destroy
    respond_to do |format|
      format.html { redirect_to risks_url, notice: 'Risk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk
      @risk = Risk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def risk_params
      params.require(:risk).permit(:name, :label, :probability, :impact, :controls, :category_id)
    end
end
