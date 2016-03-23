`import TilesTemplate from 'warehouse/templates/warehouse/admin/tiles'`
`import TileTemplate from 'warehouse/templates/warehouse/admin/tiles/tile'`
`import NewRoute from 'warehouse/routes/warehouse/admin/build/tiles/new'`
`import {PolymorphicRoutes} from 'warehouse/router'`
`import Ember from 'ember'`

{String: {pluralize}} = Ember

initialize = (application) ->
  for tile in PolymorphicRoutes
    application.register "template:warehouse/admin/#{pluralize tile}", TilesTemplate
    application.register "template:warehouse/admin/#{pluralize tile}/#{tile}", TileTemplate
    application.register "route:warehouse/admin/build/#{pluralize tile}/new", NewRoute

TemplatePolymorphInitializer =
  name: 'template-polymorph'
  initialize: initialize

`export {initialize}`
`export default TemplatePolymorphInitializer`
