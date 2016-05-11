Template.inkSearch.events
	
	"keypress .ui.search#print-search": () ->
		printer_name = []
		printer_object = Printers.find()
		printer_object.forEach (printer) ->
			printer_name.push {title: printer.description}
		$('.ui.search')
			.search({
				source: printer_name,
				templates:
					message: (type, message) ->
						noResults = TAPi18n.__ 'no-result-print-search'
						html = '<h5>' + noResults + '</h5>'
						return html
						})

	"click #printer-search": (evt, tmpl) ->
		evt.preventDefault()
		printer = $('.prompt').val()
		selected_printer = Printers.findOne(description: printer).systemId
		selection_empty = PrinterSelection.find().count() is 0
		if selection_empty is true
			PrinterSelection.insert(id: selected_printer)
		else
			PrinterSelection.remove({})
			PrinterSelection.insert(id: selected_printer)

Template.inkSearch.helpers
	
	searchplaceholder:  ->
		TAPi18n.__ 'search-placeholder'

Template.printerSearchResults.helpers

	selected_printer_features: ->
		selected_printer = PrinterSelection.findOne().id
		Printers.find(systemId: selected_printer)

Template.printerSearchResults.events

	"mouseenter #printer-img": (e, t) ->
		$("#printer-img").removeClass("small").addClass("big")

	"mouseleave #printer-img": (e, t) ->
		$('#printer-img').removeClass("big").addClass("small")