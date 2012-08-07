class MovieClub.Models.Movie extends Backbone.Model

  initialize: ->
    @url = "/movies/" + @get("id")