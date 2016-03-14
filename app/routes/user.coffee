`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
UserRoute = Ember.Route.extend AuthenticatedRouteMixin,
  socket: Ember.inject.service "socket"

  model: ->
    @xession
    .get "model"
    .get "user"
  afterModel: ->
    @get("socket").connect()

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/user",
      outlet: "sidenav"
      into: "application"

`export default UserRoute`