`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

WarehouseAdminRoute = Ember.Route.extend AuthenticatedRouteMixin,
  socket: Ember.inject.service("socket")
  beforeModel: ->
    switch 
      when @session.get("warehouseAdmin")? then null
      when @session.get("warehouseAccount")? then @transitionTo "apiz"
      when @session.get("isAuthenticated") then @transitionTo "apix"
      else @_super arguments...

  model: ->
    @xession
    .get("model")
    .get("user")
  afterModel: (user) ->
    @xession.connect("user")


`export default WarehouseAdminRoute`