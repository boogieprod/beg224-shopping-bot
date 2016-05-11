Meteor.startup ->
  if Meteor.isClient
      TAPi18n.setLanguage('fr')
