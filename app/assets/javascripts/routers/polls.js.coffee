class MovieClub.Routers.Polls extends Backbone.Router
  routes:
    "admin/polls/new": "adminNew"

  adminNew: ->
    window.view = new MovieClub.Views.PollsIndex
    $(".control-group.jscontainer").html(window.view.render().el)