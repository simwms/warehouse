`import Ember from 'ember'`
{inject: {service}, computed: {alias, or: oneOf}} = Ember
ComplexActionManagerComponent = Ember.Component.extend
  classNames: ["complex-action-manager"]
  classNameBindings: ["shouldDisplay:complex-action-manager-show:complex-action-manager-hide"]
  fsm: service "finite-state-machine"
  currentAction: alias "fsm.currentAction"
  shouldDisplay: oneOf "currentAction.isNeedy", "currentAction.isFulfilled"

  abandonCurrentAction: ->
    @get("fsm").reset()

`export default ComplexActionManagerComponent`
