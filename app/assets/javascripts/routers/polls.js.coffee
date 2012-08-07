class MovieClub.Routers.Polls extends Backbone.Router
  routes:
    "admin/polls": "adminIndex"

  adminIndex: ->
    alert('caught')