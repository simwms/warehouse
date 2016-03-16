`import Ember from 'ember'`
`import _x from 'autox/utils/xdash'`

{computed: {apply}} = _x
{computed: {alias}, String: {pluralize}} = Ember

SubNavComponent = Ember.Component.extend
  classNames: ["btn-group"]
  pages: ["index", "edit", "histories"]
  basePath: "warehouse.worker"
  collectionName: apply "modelName", pluralize
  modelName: alias "model.constructor.modelName"
  btnClass: "btn btn-default"
`export default SubNavComponent`
