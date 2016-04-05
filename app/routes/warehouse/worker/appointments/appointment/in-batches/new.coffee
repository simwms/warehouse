`import Ember from 'ember'`

Route = Ember.Route.extend
  defaultModelName: "batch"
  defaultModelShowPath: -> "warehouse.worker.batches.batch"
  routeAction: "collection#new"
  model: ->
    @store.createRecord "batch",
      inAppointment: @modelFor "warehouse.worker.appointments.appointment"

`export default Route`