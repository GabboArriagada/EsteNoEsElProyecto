require 'test_helper'

class Profesor::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor_post = profesor_posts(:one)
  end

  test "should get index" do
    get profesor_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_profesor_post_url
    assert_response :success
  end

  test "should create profesor_post" do
    assert_difference('Profesor::Post.count') do
      post profesor_posts_url, params: { profesor_post: {  } }
    end

    assert_redirected_to profesor_post_url(Profesor::Post.last)
  end

  test "should show profesor_post" do
    get profesor_post_url(@profesor_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesor_post_url(@profesor_post)
    assert_response :success
  end

  test "should update profesor_post" do
    patch profesor_post_url(@profesor_post), params: { profesor_post: {  } }
    assert_redirected_to profesor_post_url(@profesor_post)
  end

  test "should destroy profesor_post" do
    assert_difference('Profesor::Post.count', -1) do
      delete profesor_post_url(@profesor_post)
    end

    assert_redirected_to profesor_posts_url
  end
end
