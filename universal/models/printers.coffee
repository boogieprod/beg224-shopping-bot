@Printers = new TAPi18n.Collection 'printers'

PrintersSchema =

	manufacturer:
		type: Schemas.Manufacturers
		autoform:
			options: ->
				_.map Manufacturers.find().fetch(), (manuf) ->
					label: manuf.name
					value: manuf.systemId

	model:
		type: Schemas.PrinterModels
		autoform:
			options: ->
				_.map PrinterModels.find().fetch(), (model) ->
					label: label.name
					value: label.systemId

	model_number:
		type: String

	compatible_blk_ink:
		type: [String]

	compatible_clr_ink:
		type: [String]

	description:
		type: String

	ink_type:
		type: String

	"i18n.fr.ink_type":
		type: String

	img:
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

Printers.attachSchema PrintersSchema