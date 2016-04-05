`import Ember from 'ember'`

Route = Ember.Route.extend
  defaultModelName: "batch"
  model: ->
    @modelFor "warehouse.worker.appointments.appointment"
    .get "inBatches"

`export default Route`