require 'test_helper'

class Profesor::AsignaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profesor_asignatura = profesor_asignaturas(:one)
  end

  test "should get index" do
    get profesor_asignaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_profesor_asignatura_url
    assert_response :success
  end

  test "should create profesor_asignatura" do
    assert_difference('Profesor::Asignatura.count') do
      post profesor_asignaturas_url, params: { profesor_asignatura: {  } }
    end

    assert_redirected_to profesor_asignatura_url(Profesor::Asignatura.last)
  end

  test "should show profesor_asignatura" do
    get profesor_asignatura_url(@profesor_asignatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_profesor_asignatura_url(@profesor_asignatura)
    assert_response :success
  end

  test "should update profesor_asignatura" do
    patch profesor_asignatura_url(@profesor_asignatura), params: { profesor_asignatura: {  } }
    assert_redirected_to profesor_asignatura_url(@profesor_asignatura)
  end

  test "should destroy profesor_asignatura" do
    assert_difference('Profesor::Asignatura.count', -1) do
      delete profesor_asignatura_url(@profesor_asignatura)
    end

    assert_redirected_to profesor_asignaturas_url
  end
end
