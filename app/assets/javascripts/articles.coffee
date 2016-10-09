@loadArticles = ->
  $.get '/ajax/articles/search', (data) ->
    window.titles = data
  searchTitle()

@searchTitle = ->
  $('.selector').autocomplete
    source: (request, response) ->
      matcher = new RegExp( '^' + $.ui.autocomplete.escapeRegex(request.term), 'i' )
      response( $.grep( window.titles, (item) ->
        return matcher.test item
      ))
    minLength: 1


$(document).on 'turbolinks:load', ->

  if $('.selector').length > 0
    loadArticles()

