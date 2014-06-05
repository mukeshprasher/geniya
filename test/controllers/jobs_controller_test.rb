require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post :create, job: { address_id: @job.address_id, category_id: @job.category_id, cover: @job.cover, description: @job.description, employment_status: @job.employment_status, employment_type: @job.employment_type, maximum_experience: @job.maximum_experience, maximum_salary: @job.maximum_salary, minimum_experience: @job.minimum_experience, minimum_salary: @job.minimum_salary, organization_id: @job.organization_id, reference_code: @job.reference_code, sub_category_id: @job.sub_category_id, title: @job.title, user_id: @job.user_id }
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should show job" do
    get :show, id: @job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job
    assert_response :success
  end

  test "should update job" do
    patch :update, id: @job, job: { address_id: @job.address_id, category_id: @job.category_id, cover: @job.cover, description: @job.description, employment_status: @job.employment_status, employment_type: @job.employment_type, maximum_experience: @job.maximum_experience, maximum_salary: @job.maximum_salary, minimum_experience: @job.minimum_experience, minimum_salary: @job.minimum_salary, organization_id: @job.organization_id, reference_code: @job.reference_code, sub_category_id: @job.sub_category_id, title: @job.title, user_id: @job.user_id }
    assert_redirected_to job_path(assigns(:job))
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end
end
