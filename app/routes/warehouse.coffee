`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteTileLineFinders from 'warehouse/mixins/route-tile-line-finders'`

{RSVP} = Ember

WarehouseRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteTileLineFinders,
  socket: Ember.inject.service "socket"
  warehouseLoggedIn: ->
    @xession.get("loggedIn") and @xession.get("authData.data.relationships.account.data.id")?
  beforeModel: ->
    switch 
      when @warehouseLoggedIn() then @get("socket").connect()
      when @xession.get("loggedIn") then @transitionTo "user"
      else @_super arguments...

  model: ->
    RSVP.hash
      scales: @findTiles "scale"
      desks: @findTiles "desk"
      docks: @findTiles "dock"
      gates: @findTiles "gate"
      cells: @findTiles "cell"
      roads: @findLines "road"
      walls: @findLines "wall"

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/warehouse",
      outlet: "sidenav"
      into: "application"

  afterModel: ->
    @xession.connect "account"
    
  actions:
    query: (tile) ->
      id = tile.get "id"
      switch tile.get("tileType")
        when "cell"
          @transitionTo "warehouse.worker.cells.cell", id
        when "dock"
          @transitionTo "warehouse.worker.docks.dock", id
        when "scale"
          @transitionTo "warehouse.worker.scales.scale", id
        when "desk"
          @transitionTo "warehouse.worker.appointments"

`export default WarehouseRoute`