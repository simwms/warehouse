`import Ember from 'ember'`

Route = Ember.Route.extend
  defaultModelName: "batch"
  routeAction: "collection#index"
  model: ->
    @modelFor "warehouse.worker.appointments.appointment"
    .get "outBatches"

`export default Route`