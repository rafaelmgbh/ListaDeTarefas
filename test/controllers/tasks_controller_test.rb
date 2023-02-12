require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @headers = {
      'Authorization' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', '12345')
    }
  end

  test 'should get index' do
    get tasks_url, headers: @headers
    assert_response :success
  end

  test 'should get new' do
    get new_task_url, headers: @headers
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { description: @task.description, due_date: @task.due_date } }, headers: @headers
    end

    assert_redirected_to tasks_url
  end

  test 'should get edit' do
    get edit_task_url(@task), headers: @headers
    assert_response :success
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task), headers: @headers
    end

    assert_redirected_to tasks_url
  end
end
