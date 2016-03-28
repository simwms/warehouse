`import Ember from 'ember'`
`import _x from 'autox/utils/xdash'`
{RSVP, computed: {alias, or: firstPresent}} = Ember
{isPromise, computed: {computedTask, apply}} = _x

ActiveServicePlanService = Ember.Service.extend
  defaultModel:
    employees: 2
    name: "Default Null Plan"
  actualModel: computedTask "account.servicePlan", -> RSVP.resolve @get "servicePlan"
  model: firstPresent "actualModel", "defaultModel"
  name: alias "model.name"
  employees: alias "model.employees"

`export default ActiveServicePlanService`
