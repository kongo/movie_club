class MovieClub.Models.Movie extends Backbone.Model

  initialize: ->
    @url = "/movies/" + @get("id")

  imdb_url: ->
    "http://www.imdb.com/title/tt#{@get('imdb_id')}/"