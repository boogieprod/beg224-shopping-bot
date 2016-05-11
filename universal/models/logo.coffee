@Logos = new TAPi18n.Collection 'logos'

LogosSchema =

	name:
		type: String

	img_name:
		type: String

	"i18n.fr.img_name":
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

Logos.attachSchema LogosSchema