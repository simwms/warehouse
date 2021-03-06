`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import moment from 'moment'`
`import {processMacro, isLive} from 'warehouse/utils/process-query'`

{inject, RSVP} = Ember

WarehouseWorkerRoute = Ember.Route.extend AuthenticatedRouteMixin,
  socket: inject.service("socket")

  model: ->
    RSVP.hash
      appointments: @store.query "appointment", processMacro("live")
      trucks: @store.query "truck", processMacro("live")
      batches: @store.query "batch", processMacro("live")

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/warehouse/worker",
      outlet: "sidenav"
      into: "application"

  setupController: ->
    @_super arguments...
    @controllerFor "warehouse"
    .set "adminMode", false

`export default WarehouseWorkerRoute`