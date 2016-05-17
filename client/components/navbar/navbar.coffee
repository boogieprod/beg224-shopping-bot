Template.navbar.rendered = ->
	TAPi18n.subscribe 'logos'
	TAPi18n.subscribe 'services_logo'

Template.navbar.helpers

	logo: ->
		Logos.findOne(name: "Staples").img_name

	serv_logo: ->
		ServicesLogo.findOne(name: "Make More Happen").img