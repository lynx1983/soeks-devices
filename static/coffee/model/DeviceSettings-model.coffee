define ["backbone"], (Backbone)->
	class DeviceSettingsModel extends Backbone.Model
		defaults: ->
			id: "0005"
			version: "1.C"
			autoOffTime: 20
			haveAccumulator: true
			preventOff: true
			screenBrightness: 'middle'
			screenTimeout: 3
			screenAlwaysOn: true
			screenTheme: 'green'
			language: ''
			unit: 'sievert'
			threshold: 1200

		getValueString: (valueName)->
			switch valueName
				when 'language'
					if @.get(valueName) == 'ru' then 'Русский' else 'English'
				when 'screenBrightness'
					switch @.get(valueName)
						when 'middle' 
							'Middle'
						when 'high' 
							'High'
						when 'low' 
							'Low'
						else 
							''
				when 'screenTheme'
					switch @.get(valueName)
						when 'green'
							'Green'
						when 'gray'
							'Gray'
						when 'blue'
							'Blue'
						when 'white'
							'White'
						else
							''
				when 'unit'
					switch @.get(valueName)
						when 'sievert'
							'Sievert'
						when 'roentgen'
							'Roentgen'
						else
							''
				when 'thresholdSv'
					@.get("threshold") / 1000
				when 'thresholdR'
					@.get("threshold") / 10 
				else 
					@.get(valueName)

	new DeviceSettingsModel