class AskingPricesController < ApplicationController
  before_action :set_asking_price, only: [:show, :edit, :update, :destroy]

  # GET /asking_prices
  # GET /asking_prices.json
  def index
    @asking_prices = AskingPrice.all
  end

  # GET /asking_prices/1
  # GET /asking_prices/1.json
  def show
  end

  # GET /asking_prices/new
  def new
    @asking_price = AskingPrice.new
    @skills = Skill.all
  end

  # GET /asking_prices/1/edit
  def edit
  end

  # POST /asking_prices
  # POST /asking_prices.json
  def create
    @asking_price = AskingPrice.new(asking_price_params)
    @asking_price.seller_id = current_user.seller.id

    respond_to do |format|
      if @asking_price.save
        format.html { redirect_to @asking_price, notice: 'Asking price was successfully created.' }
        format.json { render :show, status: :created, location: @asking_price }
      else
        format.html { render :new }
        format.json { render json: @asking_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asking_prices/1
  # PATCH/PUT /asking_prices/1.json
  def update
    respond_to do |format|
      if @asking_price.update(asking_price_params)
        format.html { redirect_to @asking_price, notice: 'Asking price was successfully updated.' }
        format.json { render :show, status: :ok, location: @asking_price }
      else
        format.html { render :edit }
        format.json { render json: @asking_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asking_prices/1
  # DELETE /asking_prices/1.json
  def destroy
    @asking_price.destroy
    respond_to do |format|
      format.html { redirect_to asking_prices_url, notice: 'Asking price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asking_price
      @asking_price = AskingPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asking_price_params
      params.require(:asking_price).permit(:seller_id, :skill_id, :price, :quantity)
    end
end
