Meteor.startup ->

	Logo = [
				{name: "Staples", img_name: "logo_en.png", fr_img_name: "logo_fr.png"}
			]

	Serv_logo = [
				{name: "Make More Happen", img: "make_more_happen.png", fr_img: "make_more_happen_fr.png"}
			]

	Carousel = [
				{name: "Ink-helper", img_name: "copy_print_en.jpg", id: 1, fr_name: "Chercheur d'encre", fr_img_name: "copy_print_fr.png"},
				{name: "Virtual Store", img_name: "copy_print_en.jpg", id: 2, fr_name: "Magasin Virtuel", fr_img_name: "copy_print_fr.png"},
				{name: "Copy Center", img_name: "copy_print_en.jpg", id: 3, fr_name: "Centre de Copies", fr_img_name: "copy_print_fr.png"},
				{name: "Tech Center", img_name: "copy_print_en.jpg", id: 4, fr_name: "Centre technique", fr_img_name: "copy_print_fr.png"},
				{name: "Rate your experience", img_name: "copy_print_en.jpg", id: 5, fr_name: "Évaluez votre expérience", fr_img_name: "copy_print_fr.png"}
			]

	Manuf = [
				{name: "Brother", logo: "brother.png", systemId: "BR"},
				{name: "Canon", logo: "canon.png", systemId: "CA"},
				{name: "Dell", logo: "dell.png", systemId: "DE"},
				{name: "Epson", logo: "epson.png", systemId: "EP"},
				{name: "HP", logo: "hp.png", systemId: "HP"},
				{name: "Lexmark", logo: "lexmark.png", systemId: "LE"},
				{name: "Panasonic", logo: "panasonic.png", systemId: "PA"},
				{name: "Samsung", logo: "samsung.png", systemId: "SA"},
				{name: "Staples", logo: "staples.png", systemId: "OB"},
				{name: "Sharp", logo: "sharp.png", systemId: "SH"},
				{name: "Xerox", logo: "xerox.png", systemId: "XE"}
			]
	Model = [
				{name: "Artisan", manufacturer: "EP", systemId: "ART"},
				{name: "Expression", manufacturer: "EP", systemId: "EXP"},
				{name: "Stylus", manufacturer: "EP", systemId: "STY"},
				{name: "WorkForce", manufacturer: "EP", systemId: "WKF"},
				{name: "Deskjet", manufacturer: "HP", systemId: "DSK"},
				{name: "ENVY", manufacturer: "HP", systemId: "ENV"},
				{name: "OfficeJet", manufacturer: "HP", systemId: "OFJ"},
				{name: "PageWide", manufacturer: "HP", systemId: "PAW"},
				{name: "Photosmart", manufacturer: "HP", systemId: "PHS"},
				{name: "LaserJet", manufacturer: "HP", systemId: "LAJ"},
				{name: "Color LaserJet", manufacturer: "HP", systemId: "CLJ"},
				{name: "TopShot LaserJet", manufacturer: "HP", systemId: "TOS"}
			]
			
	if Manufacturers.find().count() is 0

		Manuf.forEach (manuf) ->
			Manufacturers.insert {name: manuf.name, logo: manuf.logo, systemId: manuf.systemId}

	if PrinterModels.find().count() is 0

		Model.forEach (model) ->
			PrinterModels.insert {name: model.name, manufacturer: model.manufacturer, systemId: model.systemId}

	if HomeCarousel.find().count() is 0

		Carousel.forEach (carousel) ->
			HomeCarousel.insertTranslations {name: carousel.name, img_name: carousel.img_name, id: carousel.id}, fr: {name: carousel.fr_name, img_name: carousel.fr_img_name}

	if Logos.find().count() is 0

		Logo.forEach (logo) ->
			Logos.insertTranslations {name: logo.name, img_name: logo.img_name}, fr: {img_name: logo.fr_img_name}

	if ServicesLogo.find().count() is 0

		Serv_logo.forEach (logo) ->
			ServicesLogo.insertTranslations {name: logo.name, img: logo.img}, fr: {img: logo.fr_img}