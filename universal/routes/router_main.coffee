Router.map ->

	@route "homeUI",
		path: "/"
		waitOn: ->
			TAPi18n.subscribe 'home_carousel'
			TAPi18n.subscribe 'manufacturers'

	@route "inkSearch",
		path: "/ink-search"
		waitOn: ->
			TAPi18n.subscribe 'printers'
			Meteor.subscribe 'printer_models'
			Meteor.subscribe 'manufacturers'
			TAPi18n.subscribe 'ink_cartridges'

	@route "interactiveStore",
		path: "/interactive-store"

	@route "serviceCheats",
		path: "/featured-services"