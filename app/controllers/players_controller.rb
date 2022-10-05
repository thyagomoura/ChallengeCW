class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  # GET /players or /players.json
  def index
    @players = Player.all
    render json: @players
  end

  # GET /players/1 or /players/1.json
  def show
    render json: @players
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params) && @player.contract == "Player available for trade"
        # ADD contract for player
        @player.contract = Faker::Blockchain::Aeternity.contract
        @player.save
        format.json { render :show, status: :ok, location: @player, notice: "Player was successfully updated." }
      elsif @player.update(player_params) && @player.contract.include?("ct_") && !@player.transfermarkt_id.nil?
        # withdraw a player's contract
        @player.contract = "Player available for trade"
        @player.manager_id = nil
        @player.save
        format.json { render :show, status: :ok, location: @player, notice: "Player was successfully updated." }
      else
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :position, :last_competition, :contract, :manager_id, :transfermarkt_id)
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        hmac_secret = Rails.application.credentials.dig(:JWT, :private_key)
        JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
      end
    end
end
