@ServicesBanner = new TAPi18n.Collection 'services_banner'

ServicesBannerSchema =

	name:
		type: String

	"i18n.fr.name":
		type: String

	img:
		type: String

	"i18n.fr.img":
		type: String

	description:
		type: String

	"i18n.fr.description":
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

ServicesBanner.attachSchema ServicesBannerSchema
