defmodule App.Whether.Test do
  use ExUnit.Case, async: true
  # 7326e2841c614d69466a54c0054ee6dd
  @api "http://api.openweathermap.org/data/2.5/weather?q="

  test "should return a encoded endpoint when take a location" do
    appid = App.Whether.get_appid()
    endpoint = App.Whether.get_endpoint("Rio de Janeiro")
    assert "#{@api}Rio de Janeiro&appid=#{appid}" == endpoint
  end

  test "should return Celcius when take kelvin" do
    kelvin_example = 296.48
    celsius_exemple = 23.3
    temperature = App.Whether.kelvin_to_celsius(kelvin_example)
    assert temperature === celsius_exemple
  end

  test "should return temperature when take a valid location" do
    temperature = App.Whether.temperature_of("Rio de Janeiro")
    assert String.contains?(temperature, "Rio de Janeiro") == true
  end

  test "should return temperature when take a invalid location" do
    result = App.Whether.temperature_of("00000")
    assert result == "00000 not found"
  end
end
