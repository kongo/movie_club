class MovieClub.Views.PollsIndex extends Backbone.View
  template: JST['polls/new']
  partials:
    movie: JST['polls/_movie']

  events:
    "click button.query-trigger": "findMovie"
    "click a.close": "removeMovie"
    "keypress input#search-query": "preventEnterKey"

  render: ->
    @$el.html(@template())
    this

  findMovie: ->
    $("button.query-trigger").attr("disabled", "disabled")
    movie = new MovieClub.Models.Movie;
    movie.url = "/movie_finder/search?query=" + $("#search-query").val()
    movie.fetch({
      success: (resp, status, xhr)=>
        if resp.id?
          @addMovie(resp)
          $("#search-query").val("")
        else
          alert "Wrong link"

        $("button.query-trigger").removeAttr("disabled")
    })

  addMovie: (movie)->
    last_movie_el = $(".selected-movies li:last .movie-id")[0]
    num = 1
    num += parseInt(last_movie_el.attributes["rel"].value) if last_movie_el?
    @$el.find(".selected-movies").append(@partials.movie({
      movie: movie
      num: num
    }))

  removeMovie: (event)->
    event.preventDefault()
    li = $(event.target).parents("li.movie:first")
    li.remove()

  preventEnterKey: (event)->
    if (event.which == 13)
      event.preventDefault()