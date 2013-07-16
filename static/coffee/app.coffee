require [
	"underscore",
	"backbone",
	"i18n/i18n",
	"model/DeviceSettings-model"	
	"view/Device-view",
	"view/MenuScreen-view",
	"view/MenuItem-view",
	"view/TemplatedScreen-view"
	"view/MeasurementResultScreen-view"
	"view/SplashScreen-view"
	], 
	(_, Backbone, i18n, DeviceSettings, Device, MenuScreenView, MenuItem, TemplatedScreenView,  MeasurementResultScreenView, SplashScreenView)->
		StartMenuScreen = new MenuScreenView
			name: "start-menu"
			items: [
				new MenuItem
					title: "Measurement"
					screen: "measurement-menu"
					align: "center"
				new MenuItem
					title: "Main menu"
					screen: "main-menu"
					align: "center"
			]

		MainMenuScreen = new MenuScreenView
			name: "main-menu"
			title: "Main menu"
			items: [
				new MenuItem
					title: "Units"
					settingsValue: "unit"
					showValue: true
					screen: "unit-setting-menu"
				new MenuItem
					title: "Language"
					settingsValue: "language"
					showValue: true
					screen: "language-setting-menu"
				new MenuItem
					title: "Settings"
					screen: "settings-menu"
				new MenuItem
					title: "Information"
					screen: "information-screen"
				new MenuItem
					title: "FW version"
					text: DeviceSettings.get "version"
				new MenuItem
					title: "ID"
					text: DeviceSettings.get "id"
			]

		UnitSettingsMenuScreen = new MenuScreenView
			name: "unit-setting-menu"
			title: "Units"
			items: [
				new MenuItem
					title: "Sievert"
					checkbox: true
					settingsValue: "unit"
					checkedValue: 'sievert'
				new MenuItem
					title: "Roentgen"
					checkbox: true
					settingsValue: "unit"
					checkedValue: 'roentgen'
			]

		SettingsMenuScreen = new MenuScreenView
			name: "settings-menu"
			title: "Settings"
			items: [
				new MenuItem
					title: "Thres, &micro;R/h"
					settingsValue: "threshold"
					showSettingsValue: "thresholdR"
					showValue: true
					screen: "threshold-roentgen-settings-menu"
				new MenuItem
					title: "Thres, &micro;Sv/h"
					settingsValue: "threshold"
					showSettingsValue: "thresholdSv"
					showValue: true
					screen: "threshold-sievert-settings-menu"
				new MenuItem
					title: "Screen"
					screen: "screen-settings-menu"
				new MenuItem
					title: "Sound"
					screen: "sound-settings-menu"
				new MenuItem
					title: "Power"
					screen: "power-settings-menu"
			]

		ScreenSettingsMenuScreen = new MenuScreenView
			name: "screen-settings-menu"
			title: "Screen"
			items: [
				new MenuItem
					title: "Brightness"
					showValue: true
					settingsValue: "screenBrightness"
					screen: "screen-brightness-settings-menu"
				new MenuItem
					title: "Turned on, min"
					settingsValue: "screenTimeout"
					showValue: true
					screen: "screen-timeout-settings-menu"
				new MenuItem
					title: "Always on"
					text: if DeviceSettings.get "screenAlwaysOn" then 'Да' else 'Нет'
				new MenuItem
					title: "Theme"
					settingsValue: "screenTheme"
					showValue: true
					screen: "theme-settings-menu"
			]

		PowerSettingsMenuScreen = new MenuScreenView
			name: "power-settings-menu"
			title: "Power"
			items: [
				new MenuItem
					title: "Аккумуляторы"
					text: if DeviceSettings.get "haveAccumulator" then 'Да' else 'Нет'
				new MenuItem
					title: "Autooff, min"
					text: DeviceSettings.get "autoOffTime"
				new MenuItem
					title: "Dont off"
					text: if DeviceSettings.get "preventOff" then 'Да' else 'Нет'
			]

		LanguageSettingsMenuScreen = new MenuScreenView
			name: "language-setting-menu"
			title: "Language"
			items: [
				new MenuItem
					title: "Русский"
					checkbox: true
					settingsValue: "language"
					checkedValue: 'ru'
				new MenuItem
					title: "English"
					checkbox: true
					settingsValue: "language"
					checkedValue: 'en'
			]

		ScreenBrightnessSettingsScreen = new MenuScreenView
			name: "screen-brightness-settings-menu"
			title: "Brightness"
			items: [
				new MenuItem
					title: "Low"
					checkbox: true
					settingsValue: "screenBrightness"
					checkedValue: 'low'
				new MenuItem
					title: "Middle"
					checkbox: true
					settingsValue: "screenBrightness"
					checkedValue: 'middle'
				new MenuItem
					title: "High"
					checkbox: true
					settingsValue: "screenBrightness"
					checkedValue: 'high'
			]

		ThemeSettingsScreen = new MenuScreenView
			name: "theme-settings-menu"
			title: "Theme"
			items: [
				new MenuItem
					title: "Green"
					checkbox: true
					settingsValue: "screenTheme"
					checkedValue: 'green'
				new MenuItem
					title: "Gray"
					checkbox: true
					settingsValue: "screenTheme"
					checkedValue: 'gray'
				new MenuItem
					title: "Blue"
					checkbox: true
					settingsValue: "screenTheme"
					checkedValue: 'blue'
				new MenuItem
					title: "White"
					checkbox: true
					settingsValue: "screenTheme"
					checkedValue: 'white'
			]

		ThresholdRSettingsScreen = new MenuScreenView
			name: "threshold-roentgen-settings-menu"
			title: "Thres, &micro;R/h"
			items: [
				new MenuItem
					title: "30"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 300
					align: "center"
				new MenuItem
					title: "40"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 400
					align: "center"
				new MenuItem
					title: "50"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 500
					align: "center"
				new MenuItem
					title: "60"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 600
					align: "center"
				new MenuItem
					title: "70"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 700
					align: "center"
				new MenuItem
					title: "80"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 800
					align: "center"
				new MenuItem
					title: "90"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 900
					align: "center"
				new MenuItem
					title: "100"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1000
					align: "center"
				new MenuItem
					title: "120"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1200
					align: "center"
				new MenuItem
					title: "150"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1500
					align: "center"
				new MenuItem
					title: "200"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 2000
					align: "center"
				new MenuItem
					title: "500"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 5000
					align: "center"
				new MenuItem
					title: "1000"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 10000
					align: "center"
				new MenuItem
					title: "2000"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 20000
					align: "center"
				new MenuItem
					title: "5000"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 50000
					align: "center"
				new MenuItem
					title: "10000"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 100000
					align: "center"
			]

		ThresholdSvSettingsScreen = new MenuScreenView
			name: "threshold-sievert-settings-menu"
			title: "Thres, &micro;Sv/h"
			items: [
				new MenuItem
					title: "0,3"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 300
					align: "center"
				new MenuItem
					title: "0,4"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 400
					align: "center"
				new MenuItem
					title: "0,5"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 500
					align: "center"
				new MenuItem
					title: "0,6"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 600
					align: "center"
				new MenuItem
					title: "0,7"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 700
					align: "center"
				new MenuItem
					title: "0,8"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 800
					align: "center"
				new MenuItem
					title: "0,9"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 900
					align: "center"
				new MenuItem
					title: "1"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1000
					align: "center"
				new MenuItem
					title: "1,2"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1200
					align: "center"
				new MenuItem
					title: "1,5"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 1500
					align: "center"
				new MenuItem
					title: "2"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 2000
					align: "center"
				new MenuItem
					title: "5"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 5000
					align: "center"
				new MenuItem
					title: "10"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 10000
					align: "center"
				new MenuItem
					title: "20"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 20000
					align: "center"
				new MenuItem
					title: "50"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 50000
					align: "center"
				new MenuItem
					title: "100"
					checkbox: true
					settingsValue: "threshold"
					checkedValue: 100000
					align: "center"
			]

		ScreenTimeoutSettingsScreen = new MenuScreenView
			name: "screen-timeout-settings-menu"
			title: "Turned on, min"
			items: [
				new MenuItem
					title: "1"
					checkbox: true
					settingsValue: "screenTimeout"
					checkedValue: 1
				new MenuItem
					title: "3"
					checkbox: true
					settingsValue: "screenTimeout"
					checkedValue: 3
				new MenuItem
					title: "5"
					checkbox: true
					settingsValue: "screenTimeout"
					checkedValue: 5
				new MenuItem
					title: "10"
					checkbox: true
					settingsValue: "screenTimeout"
					checkedValue: 10
				new MenuItem
					title: "15"
					checkbox: true
					settingsValue: "screenTimeout"
					checkedValue: 15
			]

		InformationScreen = new TemplatedScreenView
			name: "information-screen"
			title: "Information"
			template: '#info-screen-template'
			events: [
				name: 'button.click'
				callback: (button)->
					@eventBus.trigger "device.screen.prev" if button == 'left'
			]

		MeasurementResultScreen = new MeasurementResultScreenView
			name: "measurement-result-screen";
			title: "Nitrat-tester"
			template: '#measurement-result-screen-template'
			events: [
				name: 'button.click'
				callback: (button)->
					if button == 'left'
						@eventBus.trigger "device.screen.prev" 
			]

		SplashScreen = new SplashScreenView
			name: "splash-screen"
			nextScreen: 'start-menu'
			noTrackScreen: true
		
		Device.addScreen StartMenuScreen
		Device.addScreen MainMenuScreen
		Device.addScreen SettingsMenuScreen
		Device.addScreen UnitSettingsMenuScreen
		Device.addScreen ScreenSettingsMenuScreen
		Device.addScreen PowerSettingsMenuScreen
		Device.addScreen LanguageSettingsMenuScreen
		Device.addScreen ScreenBrightnessSettingsScreen
		Device.addScreen ScreenTimeoutSettingsScreen
		Device.addScreen ThresholdSvSettingsScreen
		Device.addScreen ThresholdRSettingsScreen
		Device.addScreen ThemeSettingsScreen
		Device.addScreen InformationScreen
		Device.addScreen MeasurementResultScreen
		Device.addScreen SplashScreen

		DeviceSettings.set
			language: (navigator.language || navigator.userLanguage || 'en').substring 0, 2

		Device.setCurrentScreen "splash-screen"