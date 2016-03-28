`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
UserRoute = Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    @xession
    .get "model"
    .get "user"
    .catch =>
      @xession.logout()
      @notify.alert "Your session cookie was invalid, please login again"
      @transitionTo "index"

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/user",
      outlet: "sidenav"
      into: "application"

`export default UserRoute`