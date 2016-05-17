@ServicesLogo = new TAPi18n.Collection "services_logo"

ServicesLogoSchema =

	name:
		type: String

	img:
		type: String

	"i18n.fr.img":
		type: String

	createdAt:
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type: Date
		optional: true
		autoValue: ->
			if this.isUpdate
				new Date()

ServicesLogo.attachSchema ServicesLogoSchema