`import Ember from 'ember'`

RouteTileLineFindersMixin = Ember.Mixin.create
  findTiles: (type) ->
    @store
    .findAll type
    .then (tiles) ->
      tiles.map markTile
  findLines: (type) ->
    @store
    .findAll type
    .then (tiles) ->
      tiles.map markLine

`export default RouteTileLineFindersMixin`
