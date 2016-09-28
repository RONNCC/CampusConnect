class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(:page => params[:page]).per_page(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to home_path, notice: 'User was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.active = true
    # @buyer = Buyer.new
    # @seller = Seller.new

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        # @buyer.user_id = @user.id
        # @buyer.save
        # @seller.user_id = @user.id
        # @seller.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def user_reviews
    @user = User.find(params[:u_id])
    @saj = @user.seller_accepted_jobs
    @baj = @user.buyer_accepted_jobs
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id,:user,:username, :password, :password_confirmation, :role, :first_name,
      :last_name, :phone, :email, :buyer_bio, :seller_bio, :user_bio)
    end
end
