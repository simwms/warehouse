`import Ember from 'ember'`
`import _ from 'lodash/lodash'`
{chain, partialRight} = _
{set} = Ember
WarehouseAdminAccountRoute = Ember.Route.extend
  model: ->
    @xession
    .get "model"
    .get "account"

`export default WarehouseAdminAccountRoute`