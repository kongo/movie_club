window.MovieClub =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new MovieClub.Routers.Polls()
    Backbone.history.start pushState: true


$(document).ready ->
  MovieClub.init()
