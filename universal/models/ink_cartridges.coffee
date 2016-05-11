@InkCartridges = new TAPi18n.Collection 'ink_cartridges'

InkCartridgesSchema =

	manufacturer:
		type: Schemas.Manufacturers
		autoform:
			options: ->
				_.map Manufacturers.find().fetch(), (manuf) ->
					label: manuf.name
					value: manuf.systemId

	cartridge_number:
		type: String

	cartridge_type:
		type: String

	cartridge_color:
		type: String

	cartridge_yield:
		type: String

	description:
		type: String

	"i18n.fr.description":
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

InkCartridges.attachSchema InkCartridgesSchema