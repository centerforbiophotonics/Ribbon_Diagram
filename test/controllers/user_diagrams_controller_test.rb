require 'test_helper'

class UserDiagramsControllerTest < ActionController::TestCase
  setup do
    @user_diagram = user_diagrams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_diagrams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_diagram" do
    assert_difference('UserDiagram.count') do
      post :create, user_diagram: { diagram_id: @user_diagram.diagram_id, user_id: @user_diagram.user_id }
    end

    assert_redirected_to user_diagram_path(assigns(:user_diagram))
  end

  test "should show user_diagram" do
    get :show, id: @user_diagram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_diagram
    assert_response :success
  end

  test "should update user_diagram" do
    patch :update, id: @user_diagram, user_diagram: { diagram_id: @user_diagram.diagram_id, user_id: @user_diagram.user_id }
    assert_redirected_to user_diagram_path(assigns(:user_diagram))
  end

  test "should destroy user_diagram" do
    assert_difference('UserDiagram.count', -1) do
      delete :destroy, id: @user_diagram
    end

    assert_redirected_to user_diagrams_path
  end
end
