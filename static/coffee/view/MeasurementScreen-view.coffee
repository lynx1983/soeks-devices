define [
	"view/TemplatedScreen-view"
	"model/DeviceSettings-model"
	"collection/Measurements-collection"
	"i18n/i18n"
	], (TemplatedScreenView, DeviceSettings, Measurements, i18n)->
	class MeasurementScreenView extends TemplatedScreenView
		initialize:->
			@template = _.template $(@options.template).html()
			@tag = ''

		render:->
			lastValue = Measurements.last()
			value = lastValue.get "value"

			@$el.html @template
				t: i18n.t
				title: @title
				unit: if DeviceSettings.get("unit") is "sievert" then "mcSv/h" else "mcR/h"
				value: value
			@

		activate:->
			super
			console.log "Screen [#{@name}] custom activate"
			Measurements.on "add change", @render, @

		deactivate:->
			super			
			console.log "Screen [#{@name}] custom deactivate"
			Measurements.off "add change", @render, @