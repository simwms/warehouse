`import Ember from 'ember'`

markTile = (x) -> 
  x.set "tileType", x.constructor.modelName
  x
markLine = (x) -> 
  x.set "lineType", x.constructor.modelName
  x

RouteTileLineFindersMixin = Ember.Mixin.create
  findTiles: (type) ->
    @store
    .findAll type
    .then (tiles) ->
      tiles.map markTile
  findLines: (type) ->
    @store
    .findAll type
    .then (lines) ->
      lines.map markLine

`export default RouteTileLineFindersMixin`
