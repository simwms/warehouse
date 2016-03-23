`import Ember from 'ember'`
`import _ from 'lodash/lodash'`
{chain, partialRight} = _
{set} = Ember
WarehouseAdminDestroyRoute = Ember.Route.extend
  tearDownDestructionMode: Ember.on "deactivate", ->
    chain @controllerFor "warehouse"
    .tap partialRight(set, "shouldYield", true)
    .tap partialRight(set, "destroyMode", false)
    .value()

  setupDestructionMode: Ember.on "activate", ->
    chain @controllerFor "warehouse"
    .tap partialRight(set, "shouldYield", false)
    .tap partialRight(set, "destroyMode", true)
    .value()

`export default WarehouseAdminDestroyRoute`