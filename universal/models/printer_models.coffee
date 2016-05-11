@PrinterModels = new Meteor.Collection 'printer_models'

PrinterModelsSchema =

	manufacturer:
		type: Schemas.Manufacturers
		autoform:
			options: ->
				_.map Manufacturers.find().fetch(), (manuf) ->
					label: manuf.name
					value: manuf.systemId

	name:
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

PrinterModels.attachSchema PrinterModelsSchema