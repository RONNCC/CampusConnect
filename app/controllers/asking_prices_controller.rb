class AskingPricesController < ApplicationController
  before_action :set_asking_price, only: [:show, :edit, :update, :destroy]

  # GET /asking_prices
  # GET /asking_prices.json
  def index
    @asking_prices = AskingPrice.all
    if logged_in?
      @your_ap = AskingPrice.open_for_user(current_user.id)
      @other_ap = AskingPrice.open_not_for_user(current_user.id)
    else
      ap1 = AskingPrice.open_for_user(1).to_a
      ap2 = AskingPrice.open_not_for_user(1).to_a
      @all_ap = ap1 + ap2
    end
  end

  # GET /asking_prices/1
  # GET /asking_prices/1.json
  def show
  end

  # GET /asking_prices/new
  def new
    @asking_price = AskingPrice.new
    @skills = Skill.for_user(current_user.id)
  end

  # GET /asking_prices/1/edit
  def edit
    @skills = Skill.for_user(current_user.id)
  end

  # POST /asking_prices
  # POST /asking_prices.json
  def create
    @asking_price = AskingPrice.new(asking_price_params)

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
