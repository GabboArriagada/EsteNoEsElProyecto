require 'test_helper'

class Alumno::AsignaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumno_asignatura = alumno_asignaturas(:one)
  end

  test "should get index" do
    get alumno_asignaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_alumno_asignatura_url
    assert_response :success
  end

  test "should create alumno_asignatura" do
    assert_difference('Alumno::Asignatura.count') do
      post alumno_asignaturas_url, params: { alumno_asignatura: {  } }
    end

    assert_redirected_to alumno_asignatura_url(Alumno::Asignatura.last)
  end

  test "should show alumno_asignatura" do
    get alumno_asignatura_url(@alumno_asignatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_alumno_asignatura_url(@alumno_asignatura)
    assert_response :success
  end

  test "should update alumno_asignatura" do
    patch alumno_asignatura_url(@alumno_asignatura), params: { alumno_asignatura: {  } }
    assert_redirected_to alumno_asignatura_url(@alumno_asignatura)
  end

  test "should destroy alumno_asignatura" do
    assert_difference('Alumno::Asignatura.count', -1) do
      delete alumno_asignatura_url(@alumno_asignatura)
    end

    assert_redirected_to alumno_asignaturas_url
  end
end
