require 'test_helper'

class AcceptedJobsControllerTest < ActionController::TestCase
  setup do
    @accepted_job = accepted_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accepted_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accepted_job" do
    assert_difference('AcceptedJob.count') do
      post :create, accepted_job: { asking_price_id: @accepted_job.asking_price_id, buyer_rating: @accepted_job.buyer_rating, buyer_review: @accepted_job.buyer_review, completed: @accepted_job.completed, job_posting_id: @accepted_job.job_posting_id, seller_rating: @accepted_job.seller_rating, seller_review: @accepted_job.seller_review }
    end

    assert_redirected_to accepted_job_path(assigns(:accepted_job))
  end

  test "should show accepted_job" do
    get :show, id: @accepted_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accepted_job
    assert_response :success
  end

  test "should update accepted_job" do
    patch :update, id: @accepted_job, accepted_job: { asking_price_id: @accepted_job.asking_price_id, buyer_rating: @accepted_job.buyer_rating, buyer_review: @accepted_job.buyer_review, completed: @accepted_job.completed, job_posting_id: @accepted_job.job_posting_id, seller_rating: @accepted_job.seller_rating, seller_review: @accepted_job.seller_review }
    assert_redirected_to accepted_job_path(assigns(:accepted_job))
  end

  test "should destroy accepted_job" do
    assert_difference('AcceptedJob.count', -1) do
      delete :destroy, id: @accepted_job
    end

    assert_redirected_to accepted_jobs_path
  end
end
