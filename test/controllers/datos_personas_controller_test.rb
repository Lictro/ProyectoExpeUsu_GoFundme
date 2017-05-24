require 'test_helper'

class DatosPersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datos_persona = datos_personas(:one)
  end

  test "should get index" do
    get datos_personas_url
    assert_response :success
  end

  test "should get new" do
    get new_datos_persona_url
    assert_response :success
  end

  test "should create datos_persona" do
    assert_difference('DatosPersona.count') do
      post datos_personas_url, params: { datos_persona: { city: @datos_persona.city, country: @datos_persona.country, name: @datos_persona.name, receive_email: @datos_persona.receive_email } }
    end

    assert_redirected_to datos_persona_url(DatosPersona.last)
  end

  test "should show datos_persona" do
    get datos_persona_url(@datos_persona)
    assert_response :success
  end

  test "should get edit" do
    get edit_datos_persona_url(@datos_persona)
    assert_response :success
  end

  test "should update datos_persona" do
    patch datos_persona_url(@datos_persona), params: { datos_persona: { city: @datos_persona.city, country: @datos_persona.country, name: @datos_persona.name, receive_email: @datos_persona.receive_email } }
    assert_redirected_to datos_persona_url(@datos_persona)
  end

  test "should destroy datos_persona" do
    assert_difference('DatosPersona.count', -1) do
      delete datos_persona_url(@datos_persona)
    end

    assert_redirected_to datos_personas_url
  end
end
