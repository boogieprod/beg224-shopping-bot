Template.navbar.rendered = ->
	TAPi18n.subscribe 'logos'

Template.navbar.helpers

	logo: ->
		Logos.findOne(name: "Staples").img_name