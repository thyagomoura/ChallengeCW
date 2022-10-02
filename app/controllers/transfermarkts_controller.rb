class TransfermarktsController < ApplicationController
  before_action :set_transfermarkt, only: %i[ show edit update destroy ]

  # GET /transfermarkts or /transfermarkts.json
  def index
    @transfermarkts = Transfermarkt.all
    render json: @transfermarkts, include: :players
  end

  # GET /transfermarkts/1 or /transfermarkts/1.json
  def show
    render json: @transfermarkts, include: :players
  end

  # GET /transfermarkts/new
  def new
    @transfermarkt = Transfermarkt.new
  end

  # GET /transfermarkts/1/edit
  def edit
  end

  # POST /transfermarkts or /transfermarkts.json
  def create
    @transfermarkt = Transfermarkt.new(transfermarkt_params)

    respond_to do |format|
      if @transfermarkt.save
        format.html { redirect_to transfermarkt_url(@transfermarkt), notice: "Transfermarkt was successfully created." }
        format.json { render :show, status: :created, location: @transfermarkt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfermarkt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfermarkts/1 or /transfermarkts/1.json
  def update
    respond_to do |format|
      if @transfermarkt.update(transfermarkt_params)
        format.html { redirect_to transfermarkt_url(@transfermarkt), notice: "Transfermarkt was successfully updated." }
        format.json { render :show, status: :ok, location: @transfermarkt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfermarkt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfermarkts/1 or /transfermarkts/1.json
  def destroy
    @transfermarkt.destroy

    respond_to do |format|
      format.html { redirect_to transfermarkts_url, notice: "Transfermarkt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfermarkt
      @transfermarkt = Transfermarkt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfermarkt_params
      params.require(:transfermarkt).permit(
        :description, 
        :crypto, 
        :timezone,
        players_attributes:[:id, :name, :position, :last_competition, :contract]
      )
    end
end
