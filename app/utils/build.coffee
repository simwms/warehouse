build = (ghost, e1, e2) ->
  properties = switch (type = ghost.get "ghostType")
    when "2point" then Line.from(e1).to(e2)
    when "tile" then Tile.at(e1)
    else throw new Error "Unknown ghost type: #{type}"
  ghost.setProperties properties
  ghost


class Line
  @from = ({snapGridX, snapGridY}) ->
    roadCore =
      x: snapGridX
      y: snapGridY
      points: [{x: 0, y: 0}]
    to: ({snapGridX, snapGridY}) ->
      roadCore.points.pushObject 
        x: snapGridX - roadCore.x
        y: snapGridY - roadCore.y
      roadCore

class Tile
  @at = ({snapGridX, snapGridY}) ->
    x: snapGridX
    y: snapGridY

`export default build`
