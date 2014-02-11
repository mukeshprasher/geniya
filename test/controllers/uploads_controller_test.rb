require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @upload = uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, upload: { description: @upload.description, extension: @upload.extension, file_attachment: @upload.file_attachment, file_type: @upload.file_type, name: @upload.name, portfolio_id: @upload.portfolio_id, title: @upload.title }
    end

    assert_redirected_to upload_path(assigns(:upload))
  end

  test "should show upload" do
    get :show, id: @upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upload
    assert_response :success
  end

  test "should update upload" do
    patch :update, id: @upload, upload: { description: @upload.description, extension: @upload.extension, file_attachment: @upload.file_attachment, file_type: @upload.file_type, name: @upload.name, portfolio_id: @upload.portfolio_id, title: @upload.title }
    assert_redirected_to upload_path(assigns(:upload))
  end

  test "should destroy upload" do
    assert_difference('Upload.count', -1) do
      delete :destroy, id: @upload
    end

    assert_redirected_to uploads_path
  end
end
