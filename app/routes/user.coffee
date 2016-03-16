`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
UserRoute = Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    @xession
    .get "model"
    .get "user"

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/user",
      outlet: "sidenav"
      into: "application"

`export default UserRoute`