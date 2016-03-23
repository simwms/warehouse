`import Ember from 'ember'`
`import _x from 'autox/utils/xdash'`
{RSVP, inject: {service}, computed: {alias, filterBy, oneWay}} = Ember
{computed: {computedTask}} = _x

AccountUpgradeFormComponent = Ember.Component.extend
  classNames: ["account-upgrade-form"]
  formFields: alias "meta.fields"
  servicePlanFields: filterBy "formFields", "name", "servicePlan"
  servicePlanField: alias "servicePlanFields.firstObject"
  choices: alias "servicePlanField.choices"
  currentPlan: computedTask "model.servicePlan", -> RSVP.resolve @get "model.servicePlan"
  desiredPlan: oneWay "currentPlan"
  xession: service "autox-session-context"
  didReceiveAttrs: ->
    @_super arguments...
    @set "stripeToken", null

  actions:
    processStripeToken: (token) ->
      @get "model"
      .set "stripeSource", token.id
      @set "stripeToken", token
    submit: (model) ->
      model.set "servicePlan", @get("desiredPlan")
      @sendAction "action", model

`export default AccountUpgradeFormComponent`
