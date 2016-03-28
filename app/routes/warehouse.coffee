`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

{RSVP} = Ember

WarehouseRoute = Ember.Route.extend AuthenticatedRouteMixin,
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
      account: @xession.get("model.account")
      scales: @store.findAll "scale"
      desks: @store.findAll "desk"
      docks: @store.findAll "dock"
      gates: @store.findAll "gate"
      cells: @store.findAll "cell"
      roads: @store.findAll "road"
      walls: @store.findAll "wall"

  renderTemplate: ->
    @_super arguments...
    @render "sidenavs/warehouse",
      outlet: "sidenav"
      into: "application"

  afterModel: ({account}) ->
    @_super arguments...
    @activeServicePlan.set "account", account
    @xession.connect "account"

  actions:
    refresh: ->
      @refresh()

`export default WarehouseRoute`