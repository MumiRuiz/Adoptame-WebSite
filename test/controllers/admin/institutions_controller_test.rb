require 'test_helper'

class Admin::InstitutionsControllerTest < ActionController::TestCase
  setup do
    @admin_institution = admin_institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_institution" do
    assert_difference('Admin::Institution.count') do
      post :create, admin_institution: { city: @admin_institution.city, country: @admin_institution.country, email: @admin_institution.email, manager: @admin_institution.manager, name: @admin_institution.name, password: @admin_institution.password, region: @admin_institution.region, username: @admin_institution.username, website: @admin_institution.website }
    end

    assert_redirected_to admin_institution_path(assigns(:admin_institution))
  end

  test "should show admin_institution" do
    get :show, id: @admin_institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_institution
    assert_response :success
  end

  test "should update admin_institution" do
    patch :update, id: @admin_institution, admin_institution: { city: @admin_institution.city, country: @admin_institution.country, email: @admin_institution.email, manager: @admin_institution.manager, name: @admin_institution.name, password: @admin_institution.password, region: @admin_institution.region, username: @admin_institution.username, website: @admin_institution.website }
    assert_redirected_to admin_institution_path(assigns(:admin_institution))
  end

  test "should destroy admin_institution" do
    assert_difference('Admin::Institution.count', -1) do
      delete :destroy, id: @admin_institution
    end

    assert_redirected_to admin_institutions_path
  end
end
