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
						html = '<div>' + noResults + '</div>'
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

	input_amount_placeholder: ->
		TAPi18n.__ 'input_amount_placeholder'

	selected_printer_features: ->
		selected_printer = PrinterSelection.findOne().id
		Printers.find(systemId: selected_printer)

	black_yield: ->
		yieldarray = []
		blk_ink_num = this.compatible_blk_ink
		manuf = this.manufacturer
		if InkCostHelper.find().count is 0
			blk_ink_num.forEach (blkinkno) ->
				yieldpercart = InkCartridges.findOne(manufacturer: manuf, cartridge_number: blkinkno, cartridge_color: "black").cartridge_yield
				InkCostHelper.insert {yield: yieldpercart, cart_number: blkinkno}
		else
			InkCostHelper.remove({})
			blk_ink_num.forEach (blkinkno) ->
				yieldpercart = InkCartridges.findOne(manufacturer: manuf, cartridge_number: blkinkno, cartridge_color: "black").cartridge_yield
				InkCostHelper.insert {yield: yieldpercart, cart_number: blkinkno}
		InkHelper = InkCostHelper.find().fetch()
		InkHelper.forEach (inkhelp) ->
			yieldarray.push inkhelp.yield
		return yieldarray

	color_yield: ->
		yields = []
		clr_ink_num = this.compatible_clr_ink
		manuf = this.manufacturer
		clr_ink_num.forEach (clrinkno) ->
			yieldpercart = InkCartridges.findOne(manufacturer: manuf, cartridge_number: clrinkno,
				cartridge_color: "cyan").cartridge_yield
			yields.push yieldpercart
		return yields

Template.printerSearchResults.events

	"mouseenter #printer-img": (e, t) ->
		$("#printer-img").removeClass("small").addClass("large")

	"mouseleave #printer-img": (e, t) ->
		$('#printer-img').removeClass("large").addClass("small")

	"click #get-cost": (e, t) ->
		ink_cost = []
		entered_amount = $("#entered-amount").val()
		ink_helper_object = InkCostHelper.find().fetch()
		ink_helper_object.forEach (inkobj) ->
			ink_num = inkobj.cart_number
			costperpage = (Number(entered_amount) / Number(inkobj.yield)).toFixed(2)
			ink_cost.push " " + ink_num + ": " + costperpage + " $"
		$("button#get-cost").replaceWith("<button class='ui green button' id='temp_dom'>" + ink_cost + "</button>")

	"click .input": (e, t) ->
		tag = TAPi18n.__ 'cent_per_page_query'
		$("button#temp_dom").replaceWith("<button class='ui green button' id='get-cost'>" + tag + "</button>")

	