require 'test_helper'

class Profesor::CursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor_curso = profesor_cursos(:one)
  end

  test "should get index" do
    get profesor_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_profesor_curso_url
    assert_response :success
  end

  test "should create profesor_curso" do
    assert_difference('Profesor::Curso.count') do
      post profesor_cursos_url, params: { profesor_curso: {  } }
    end

    assert_redirected_to profesor_curso_url(Profesor::Curso.last)
  end

  test "should show profesor_curso" do
    get profesor_curso_url(@profesor_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesor_curso_url(@profesor_curso)
    assert_response :success
  end

  test "should update profesor_curso" do
    patch profesor_curso_url(@profesor_curso), params: { profesor_curso: {  } }
    assert_redirected_to profesor_curso_url(@profesor_curso)
  end

  test "should destroy profesor_curso" do
    assert_difference('Profesor::Curso.count', -1) do
      delete profesor_curso_url(@profesor_curso)
    end

    assert_redirected_to profesor_cursos_url
  end
end
