`import Ember from 'ember'`

RegisterRoute = Ember.Route.extend
  beforeModel: ->
    if @xession.get("loggedIn")
      @transitionTo "user"
  model: ->
    @store.createRecord "user"

`export default RegisterRoute`
