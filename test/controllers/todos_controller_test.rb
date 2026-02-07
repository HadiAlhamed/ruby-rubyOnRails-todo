require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      # We add project_id here so the database validation passes
      post todos_url, params: { 
        todo: { 
          description: @todo.description, 
          name: @todo.name, 
          project_id: @todo.project_id 
        } 
      }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    # We add project_id here as well to ensure the update is valid
    patch todo_url(@todo), params: { 
      todo: { 
        description: @todo.description, 
        name: @todo.name, 
        project_id: @todo.project_id 
      } 
    }
    assert_redirected_to todo_url(@todo)
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end
end