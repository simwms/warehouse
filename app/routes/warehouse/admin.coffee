`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

WarehouseAdminRoute = Ember.Route.extend AuthenticatedRouteMixin,
  employeeRole: ->
    @xession.get("model.employee")
    .then (employee) ->
      employee.get("role")
  beforeModel: ->
    @employeeRole()
    .then (role) ->
      unless role in ["admin", "superadmin"]
        @transitionTo "warehouse.index"
        @notify.alert "You are not an admin"

  setupController: ->
    @_super arguments...
    @controllerFor "warehouse"
    .set "adminMode", true

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/warehouse/admin",
      outlet: "sidenav"
      into: "application"

  actions:
    closeAccount: (account) ->
      account.destroyRecord()
      .then =>
        @transitionTo "user.accounts"
      .then =>
        window.location.reload()

`export default WarehouseAdminRoute`