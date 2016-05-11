@HomeCarousel = new TAPi18n.Collection 'home_carousel'

HomeCarouselSchema =

	name:
		type: String

	"i18n.fr.name":
		type: String

	img_name:
		type: String

	"i18n.fr.img_name":
		type: String

	id:
		type: Number
		unique: true

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

HomeCarousel.attachSchema HomeCarouselSchema