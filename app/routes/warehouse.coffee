`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import RouteTileLineFinders from '../mixins/route-tile-line-finders'`

{RSVP} = Ember

WarehouseRoute = Ember.Route.extend AuthenticatedRouteMixin, RouteTileLineFinders,
  warehouseLoggedIn: ->
    @xession.get("loggedIn") and @xession.get("model.account.id")?
  beforeModel: ->
    switch 
      when @warehouseLoggedIn() then "ok"
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


`export default WarehouseRoute`