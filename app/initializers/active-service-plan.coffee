
initialize = (application) ->
  application.inject "route", "activeServicePlan", "service:active-service-plan"
  application.inject "controller", "activeServicePlan", "service:active-service-plan"

ActiveServicePlanInitializer =
  name: 'active-service-plan'
  initialize: initialize

`export {initialize}`
`export default ActiveServicePlanInitializer`
