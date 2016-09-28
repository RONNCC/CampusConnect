class AcceptedJobsController < ApplicationController
  before_action :set_accepted_job, only: [:show, :edit, :update, :destroy]

  # GET /accepted_jobs
  # GET /accepted_jobs.json
  def index
    @accepted_jobs = AcceptedJob.all
    @acc_jobs_buy = AcceptedJob.for_user_buyer(current_user.id)
    @acc_jobs_sell = AcceptedJob.for_user_seller(current_user.id)
  end

  # GET /accepted_jobs/1
  # GET /accepted_jobs/1.json
  def show
  end

  # GET /accepted_jobs/new
  def new
    @accepted_job = AcceptedJob.new
  end

  # GET /accepted_jobs/1/edit
  def edit
  end

  # POST /accepted_jobs
  # POST /accepted_jobs.json
  def create
    @accepted_job = AcceptedJob.new(accepted_job_params)

    respond_to do |format|
      if @accepted_job.save
        format.html { redirect_to @accepted_job, notice: 'Accepted job was successfully created.' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accepted_jobs/1
  # PATCH/PUT /accepted_jobs/1.json
  def update
    respond_to do |format|
      if @accepted_job.update(accepted_job_params)
        format.html { redirect_to @accepted_job, notice: 'Accepted job was successfully updated.' }
        format.json { render :show, status: :ok, location: @accepted_job }
      else
        format.html { render :edit }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accepted_jobs/1
  # DELETE /accepted_jobs/1.json
  def destroy
    @accepted_job.destroy
    respond_to do |format|
      format.html { redirect_to accepted_jobs_url, notice: 'Accepted job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def initiate_buy
    @jp = JobPosting.find(params[:jp_id])
    @ny_asking_prices = AskingPrice.open_not_for_user(current_user.id)
  end

  def make
    @accepted_job = AcceptedJob.new()
    @accepted_job.job_posting_id = params[:jp_id]
    @accepted_job.asking_price_id = params[:ap_id]

    respond_to do |format|
      if @accepted_job.save
        format.html { redirect_to accepted_jobs_path, notice: 'Accepted job was successfully created.' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  def initiate_sell
    @ap = AskingPrice.find(params[:ap_id])
    @ny_job_postings = JobPosting.open_not_for_user(current_user.id)
  end

  def review_provider
    @aj = AcceptedJob.find(params[:aj_id])
  end

  def review_update_provider
    @aj = AcceptedJob.find(params[:aj_id])
    @aj.seller_review = params[:review]
    @aj.seller_rating = params[:rating]

    respond_to do |format|
      if @aj.save
        format.html { redirect_to accepted_jobs_path, notice: 'Thank you for reviewing your experience With CampusConnect!' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  def review_client
    @aj = AcceptedJob.find(params[:aj_id])
  end

  def review_update_client
    @aj = AcceptedJob.find(params[:aj_id])
    @aj.buyer_review = params[:review]
    @aj.buyer_rating = params[:rating]

    respond_to do |format|
      if @aj.save
        format.html { redirect_to accepted_jobs_path, notice: 'Thank you for reviewing your experience With CampusConnect!' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  def completed_jobs
    acc_job_buy = AcceptedJob.comp_for_user_buyer(current_user.id).to_a
    acc_job_sell = AcceptedJob.comp_for_user_seller(current_user.id).to_a
    @acc_job_comp = acc_job_buy + acc_job_sell
  end

  def active_jobs
    all_buy = AcceptedJob.for_user_buyer(current_user.id).to_a
    all_sell = AcceptedJob.for_user_seller(current_user.id).to_a
    comp_buy = AcceptedJob.comp_for_user_buyer(current_user.id).to_a
    comp_sell = AcceptedJob.comp_for_user_seller(current_user.id).to_a
    active_buy = all_buy - comp_buy
    active_sell = all_sell - comp_sell
    @active_jobs = active_buy + active_sell
  end

  def buyer_complete
    aj = AcceptedJob.find(params[:aj_id])
    aj.buyer_completed = true
    
    respond_to do |format|
      if aj.save
        format.html { redirect_to accepted_jobs_path, notice: 'Thank you for marking the job as completed' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end

  end

  def seller_complete
    aj = AcceptedJob.find(params[:aj_id])
    aj.seller_completed = true
    
    respond_to do |format|
      if aj.save
        format.html { redirect_to accepted_jobs_path, notice: 'Thank you for marking the job as completed' }
        format.json { render :show, status: :created, location: @accepted_job }
      else
        format.html { render :new }
        format.json { render json: @accepted_job.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted_job
      @accepted_job = AcceptedJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accepted_job_params
      params.require(:accepted_job).permit(:job_posting_id, :asking_price_id, :buyer_completed, :seller_completed, :seller_review, :buyer_review, :seller_rating, :buyer_rating)
    end
end
