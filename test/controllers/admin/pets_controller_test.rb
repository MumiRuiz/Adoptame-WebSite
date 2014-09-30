require 'test_helper'

class Admin::PetsControllerTest < ActionController::TestCase
  setup do
    @admin_pet = admin_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_pet" do
    assert_difference('Admin::Pet.count') do
      post :create, admin_pet: { age: @admin_pet.age, city: @admin_pet.city, country: @admin_pet.country, gender: @admin_pet.gender, institution: @admin_pet.institution, kind: @admin_pet.kind, name: @admin_pet.name, region: @admin_pet.region, size: @admin_pet.size, story: @admin_pet.story }
    end

    assert_redirected_to admin_pet_path(assigns(:admin_pet))
  end

  test "should show admin_pet" do
    get :show, id: @admin_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_pet
    assert_response :success
  end

  test "should update admin_pet" do
    patch :update, id: @admin_pet, admin_pet: { age: @admin_pet.age, city: @admin_pet.city, country: @admin_pet.country, gender: @admin_pet.gender, institution: @admin_pet.institution, kind: @admin_pet.kind, name: @admin_pet.name, region: @admin_pet.region, size: @admin_pet.size, story: @admin_pet.story }
    assert_redirected_to admin_pet_path(assigns(:admin_pet))
  end

  test "should destroy admin_pet" do
    assert_difference('Admin::Pet.count', -1) do
      delete :destroy, id: @admin_pet
    end

    assert_redirected_to admin_pets_path
  end
end
