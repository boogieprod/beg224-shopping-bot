TAPi18n.publish 'logos', ->
	Logos.i18nFind()

TAPi18n.publish 'services_logo', ->
	ServicesLogo.i18nFind()

TAPi18n.publish 'home_carousel', ->
	HomeCarousel.i18nFind()

TAPi18n.publish 'printers', ->
	Printers.i18nFind()

Meteor.publish 'printer_models', ->
	PrinterModels.find()

Meteor.publish 'manufacturers', ->
	Manufacturers.find()

TAPi18n.publish 'ink_cartridges', ->
	InkCartridges.i18nFind()