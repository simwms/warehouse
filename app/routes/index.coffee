`import Ember from 'ember'`

IndexRoute = Ember.Route.extend
  beforeModel: ->
    if @xession.get("loggedIn")
      @transitionTo "user"
  model: ->
    @xession.get("model")


`export default IndexRoute`