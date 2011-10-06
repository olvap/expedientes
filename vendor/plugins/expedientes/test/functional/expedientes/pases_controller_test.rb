require 'test_helper'

module Expedientes
  class PasesControllerTest < ActionController::TestCase
    setup do
      @pase = pases(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:pases)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create pase" do
      assert_difference('Pase.count') do
        post :create, pase: @pase.attributes
      end
  
      assert_redirected_to pase_path(assigns(:pase))
    end
  
    test "should show pase" do
      get :show, id: @pase.to_param
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @pase.to_param
      assert_response :success
    end
  
    test "should update pase" do
      put :update, id: @pase.to_param, pase: @pase.attributes
      assert_redirected_to pase_path(assigns(:pase))
    end
  
    test "should destroy pase" do
      assert_difference('Pase.count', -1) do
        delete :destroy, id: @pase.to_param
      end
  
      assert_redirected_to pases_path
    end
  end
end
