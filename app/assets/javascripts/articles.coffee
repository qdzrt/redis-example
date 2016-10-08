$(document).on "ready page:load", ->

  $('#auto-title').autocomplete
    source:
      [ "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby" ]
