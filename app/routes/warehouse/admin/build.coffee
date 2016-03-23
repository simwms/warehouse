`import Ember from 'ember'`

WarehouseAdminBuildRoute = Ember.Route.extend
  tearDownYieldMode: Ember.on "deactivate", ->
    @controllerFor "warehouse"
    .set "shouldYield", true

  setupYieldMode: Ember.on "activate", ->
    @controllerFor "warehouse"
    .set "shouldYield", false
  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/warehouse/admin/build",
      into: "sidenavs/warehouse/admin"
`export default WarehouseAdminBuildRoute`