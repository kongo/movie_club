class MovieClub.Views.PollsIndex extends Backbone.View
  template: JST['polls/new']
  partials:
    movie: JST['polls/_movie']

  events:
    "click button.query-trigger": "findMovie"
    "click a.close": "removeMovie"

  render: ->
    @$el.html(@template())
    this

  findMovie: ->
    movie = new MovieClub.Models.Movie;
    movie.url = "/movie_finder/search?query=" + $("#search-query").val()
    movie.fetch({
      success: (resp, status, xhr)=>
        movie = new MovieClub.Models.Movie(resp)
        @addMovie(movie)
        $("#search-query").val("")
    })

  addMovie: (movie)->
    @$el.find(".selected-movies").append(@partials.movie({
      movie: movie
      num: $(".selected-movies li").length + 1
    }))

  removeMovie: (event)->
    event.preventDefault()
    li = $(event.target).parents("li.movie:first")
    li.remove()