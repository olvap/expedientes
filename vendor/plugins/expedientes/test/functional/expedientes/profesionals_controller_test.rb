require 'test_helper'

module Expedientes
  class ProfesionalsControllerTest < ActionController::TestCase
    setup do
      @profesional = profesionals(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:profesionals)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create profesional" do
      assert_difference('Profesional.count') do
        post :create, profesional: @profesional.attributes
      end
  
      assert_redirected_to profesional_path(assigns(:profesional))
    end
  
    test "should show profesional" do
      get :show, id: @profesional.to_param
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @profesional.to_param
      assert_response :success
    end
  
    test "should update profesional" do
      put :update, id: @profesional.to_param, profesional: @profesional.attributes
      assert_redirected_to profesional_path(assigns(:profesional))
    end
  
    test "should destroy profesional" do
      assert_difference('Profesional.count', -1) do
        delete :destroy, id: @profesional.to_param
      end
  
      assert_redirected_to profesionals_path
    end
  end
end
