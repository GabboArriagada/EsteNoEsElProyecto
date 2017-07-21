require 'test_helper'

class Alumno::NotasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumno_nota = alumno_notas(:one)
  end

  test "should get index" do
    get alumno_notas_url
    assert_response :success
  end

  test "should get new" do
    get new_alumno_nota_url
    assert_response :success
  end

  test "should create alumno_nota" do
    assert_difference('Alumno::Nota.count') do
      post alumno_notas_url, params: { alumno_nota: {  } }
    end

    assert_redirected_to alumno_nota_url(Alumno::Nota.last)
  end

  test "should show alumno_nota" do
    get alumno_nota_url(@alumno_nota)
    assert_response :success
  end

  test "should get edit" do
    get edit_alumno_nota_url(@alumno_nota)
    assert_response :success
  end

  test "should update alumno_nota" do
    patch alumno_nota_url(@alumno_nota), params: { alumno_nota: {  } }
    assert_redirected_to alumno_nota_url(@alumno_nota)
  end

  test "should destroy alumno_nota" do
    assert_difference('Alumno::Nota.count', -1) do
      delete alumno_nota_url(@alumno_nota)
    end

    assert_redirected_to alumno_notas_url
  end
end
