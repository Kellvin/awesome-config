local string = { match = string.match, format = string.format }
local table = { insert = table.insert }
local os = { date = os.date }
local capi = { timer = timer,
			   image = image }
local naughty = require("naughty")
local awful = require("awful")
local json = require("json")

module("weather")

local weatherbase = {}
local weatherFormat = '<span font="sans">%s</span>'
local apikey = 'f3c45fb9f8929a96f21a95ca5f470481'

-- Getting the weather information about the city
function getWeather(city, apikey)


  local response = json.decode(awful.util.pread("curl connect-timeout 1 -fsm 3 -L 'api.openweathermap.org/data/2.5/weather?APPID=" .. apikey ..  "&q=" .. city .. ",ru&lang=ru&units=metric'")) or ""
  
--  local response = json.decode('{"coord":{"lon":30.32,"lat":59.94},"weather":[{"id":802,"main":"Clouds","description":"слегка облачно","icon":"03n"}],"base":"stations","main":{"temp":266.34,"pressure":997,"humidity":85,"temp_min":264.15,"temp_max":267.59},"visibility":10000,"wind":{"speed":2,"deg":200},"clouds":{"all":40},"dt":1551639963,"sys":{"type":1,"id":8926,"message":0.0055,"country":"RU","sunrise":1551588608,"sunset":1551627128},"id":498817,"name":"Saint Petersburg","cod":200}') or ""
 
  local parse = awful.util.pread("curl connect-timeout 1 -fsm 3 -L http://pogoda.yandex.ru/"..city.."/")
	weatherbase[city].weather = {
		["cityname"] = city or "Санкт-Петербург",
		["wthtype"]	 = response["weather"][1]["description"] or "Нет данных о погоде",
		["sunrise"]	 = os.date('%H:%M', response["sys"]["sunrise"]) or "00:00",
		["sunset"]	 = os.date('%H:%M', response["sys"]["sunset"]) or "00:00",
  	["temp"]	   = response["main"]["temp_min"]  or '<span color="#ff892c"> ! </span>',
		["rhum"]	   = response["main"]["humidity"] or " Нет данных",
		["wind"]	   = response["wind"]["speed"] or " Нет данных",
		}
end

-- Setting the weather icon according to the weather type and time of day (day/night)
function wthIcon(wthtype, sunrise, sunset)
	local day = false
	local daytime = os.date("%H:%M")
	local confdir = awful.util.getdir("config")

	if sunrise and sunset
	and (daytime >= sunrise)
	and (daytime < sunset)
	then day = true end

	if (wthtype == "ясно") then
		if day then return confdir.."/weather_icons/clear.png"
		else return confdir.."/weather_icons/clear-night.png" end

	elseif (wthtype == "Полупрозрачная облачность")
		or (wthtype == "Переменная облачность")
		or (wthtype == "Облачность с просветами")
		or (wthtype == "Облачно с прояснениями")
		or (wthtype == "слегка облачно")
		or (wthtype == "Малооблачно") then
		if day then return confdir.."/weather_icons/clouds.png"
		else return confdir.."/weather_icons/clouds-night.png" end

	elseif (wthtype == "Облачно")
		or (wthtype == "Пасмурно")
		or (wthtype == "Туман") then
		return confdir.."/weather_icons/overcast.png"

	elseif (wthtype == "Слабая морось")
		or (wthtype == "Слабый дождь") then
		return confdir.."/weather_icons/drizzle.png"

	elseif (wthtype == "Небольшой дождь")
		or (wthtype == "Переменная облачность, небольшой дождь")
		or (wthtype == "Облачно, небольшой дождь") then
		return confdir.."/weather_icons/rain.png"

	elseif (wthtype == "Дождь")
		or (wthtype == "Переменная облачность, дождь")
		or (wthtype == "Облачно, дождь")
		or (wthtype == "Ливневый дождь") then
		return confdir.."/weather_icons/shower.png"

	elseif (wthtype == "Гроза")
		or (wthtype == "Дождь, гроза") then
		return confdir.."/weather_icons/storm.png"

	elseif (wthtype == "Небольшой снег")
		or (wthtype == "Переменная облачность, небольшой снег")
		or (wthtype == "Облачно, небольшой снег") then
		return confdir.."/weather_icons/light-snow.png"

	elseif (wthtype == "Снег") then
		return confdir.."/weather_icons/snow.png"

	else
		return confdir.."/weather_icons/severe-alert.png"
	end
end

-- Just formatting the data a little to display it in a notification
function wthText(wthtype, rhum,  wind, sunrise, sunset)
	return wthtype.."\n".. "Влажность: " ..rhum.."%\n".. "Ветер: " .. wind .. " м/с" .. " "  ..  "\n" .. "Восход солнца: " .. sunrise .. "\n" .. "Заход солнца: " .. sunset
end

-- Updating weather data
function updateWeather(city)
	getWeather(city, apikey)
	local w = weatherbase[city]

	for i=1, #w.widgets do
		w.widgets[i].text = string.format(weatherFormat, "   " .. w.weather.temp .. "° " .. w.weather.wind .." м/c "  .. "   ")
		w.widgets[i].image = capi.image(wthIcon(w.weather.wthtype, w.weather.sunrise, w.weather.sunset))
	end

	if w.wthinfo then
		w.wthinfo.box.widgets[2].text = wthText(w.weather.wthtype, w.weather.rhum, w.weather.sunrise, w.weather.sunset )
		w.wthinfo.box.widgets[1].image = capi.image(wthIcon(w.weather.wthtype, w.weather.sunrise, w.weather.sunset))
	end
end

-- Adding a weather monitoring to the widget
function addWeather(widget, city, timeout)
	if not widget or weatherbase[widget] ~= nil then return end
	local city = city or "Saint Petersburg"
	weatherbase[widget] = city

	if not weatherbase[city] then
		weatherbase[city] = {}
		weatherbase[city].widgets = {}
	end

	table.insert(weatherbase[city].widgets, widget)

	updateWeather(city)

	weathertimer = capi.timer { timeout = timeout or 907 }
	weathertimer:add_signal("timeout",	function() updateWeather(city)		end)
	weathertimer:start()

	widget:add_signal("mouse::enter",	function() local w = weatherbase[city]
													w.wthinfo = naughty.notify({
														--title = w.weather.cityname,
														text = wthText(w.weather.wthtype, w.weather.rhum, w.weather.wind, w.weather.sunrise, w.weather.sunset),
														icon = wthIcon(w.weather.wthtype, w.weather.sunrise, w.weather.sunset),
														timeout = 0,
                            position = "bottom_right",
														hover_timeout = 0.5,
														})					end)
	widget:add_signal("mouse::leave",	function() naughty.destroy(weatherbase[city].wthinfo)	end)
	widget:buttons(awful.util.table.join(
					awful.button({}, 1, function() updateWeather(city)		end)))
end
