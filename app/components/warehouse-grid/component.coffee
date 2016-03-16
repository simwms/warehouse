`import Ember from 'ember'`

WarehouseGridComponent = Ember.Component.extend
  actions:
    interact: (payload) ->
      @sendAction "action", payload

`export default WarehouseGridComponent`
