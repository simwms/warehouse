`import Ember from 'ember'`
{Controller, String: {pluralize}, inject: {service}} = Ember

WarehouseController = Controller.extend
  warehouseBuilder: service "warehouse-builder"
  shouldYield: true
  adminMode: false
  mapMode: "query-mode"
  destroyMode: false
  selectModels: (models) ->
    @notify.alert "not handled yet"
    console.log models 

  adminQuery: (tile) ->
    if @get "destroyMode"
      @destroyModel tile
    else
      modelName = tile.constructor.modelName
      path = ["warehouse.admin", pluralize(modelName), modelName].join "."
      @transitionToRoute path, tile
  workerQuery: (tile) ->
    switch (modelName = tile.get "tileType")
      when "cell", "dock", "scale"
        path = ["warehouse.worker", pluralize(modelName), modelName].join "."
        @transitionToRoute path, tile
      when "desk"
        @transitionToRoute "warehouse.worker.appointments"

  destroyModel: (model) ->
    model
    .destroyRecord()
    .then =>
      @send "refresh"
  saveModel: (model) ->
    model
    .save()
    .then =>
      @send "refresh"

`export default WarehouseController`
