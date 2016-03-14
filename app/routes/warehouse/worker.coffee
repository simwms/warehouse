`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteTileLineFinders from '../mixins/route-tile-line-finders'`
`import moment from 'moment'`
`import {processMacro, isLive} from 'warehouse/utils/process-query'`

{inject, RSVP} = Ember

WarehouseWorkerRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteTileLineFinders,
  socket: inject.service("socket")
  beforeModel: ->
    switch 
      when @session.get("warehouseAccount")? then null
      when @xession.get("isAuthenticated") then @transitionTo "apix"
      else @_super arguments...

  model: ->
    RSVP.hash
      appointments: @store.filter "appointment", processMacro("live"), isLive
      trucks: @store.filter "truck", processMacro("live"), isLive
      batches: @store.filter "batch", processMacro("live"), isLive

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/apiz",
      outlet: "sidenav"
      into: "apiz"

  afterModel: ->
    @get("socket")
    .connect()
    .then =>
      @xession.connect("user")


`export default WarehouseWorkerRoute`