@Manufacturers = new Meteor.Collection 'manufacturers'

ManufacturersSchema =

	name:
		type: String

	logo:
		type: String

	systemId:
		type: String
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

Manufacturers.attachSchema ManufacturersSchema
