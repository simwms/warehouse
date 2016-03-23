`import Ember from 'ember'`
`import _ from 'lodash/lodash'`
`import _x from 'autox/utils/xdash'`

{partialRight, chain} = _
{get, set} = Ember
{tapLog} = _x

WarehouseAdminBuildTilesNew = Ember.Route.extend
  tearDownBuildMode: Ember.on "deactivate", ->
    @controllerFor "warehouse"
    .set "mapMode", "query-mode"

  setupBuildMode: Ember.on "activate", ->
    @controllerFor "warehouse"
    .set "mapMode", "build-mode"

  setupController: (controller, model) ->
    @_super arguments...
    chain @controllerFor "warehouse"
    .thru partialRight(get, "model")
    .thru partialRight(set, "ghost", model)
    .value()

`export default WarehouseAdminBuildTilesNew`