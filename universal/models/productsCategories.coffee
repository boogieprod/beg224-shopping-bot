@ProductCategories = new TAPi18n.Collection 'product_categories'

ProductCategoriesSchema =

	name:
		type: String

	"i18n.fr.name":
		type: String

	systemId:
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

ProductCategories.attachSchema ProductCategoriesSchema
