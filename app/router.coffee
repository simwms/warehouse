`import Ember from 'ember'`
`import config from './config/environment'`
`import {DSL} from 'autox'`

PolymorphicRoutes = ["cell", "desk", "dock", "gate", "road", "scale", "wall"]

{String: {pluralize}} = Ember
Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  {namespace, collection, model, form, view} = DSL.import @

  @route "register"

  namespace "user", ->
    collection "accounts", ->
      form "new"
    collection "employees", ->
      view "admin"

  namespace "warehouse", ->
    namespace "admin", ->
      model "account", ->
        form "upgrade"
        form "danger"

      model "service-plan"
      
      collection "employees", ->
        form "new"
        model "employee", ->
          form "edit"
          view "terminate"

      ## ToDo: Implement polymorphic one day      
      for tile in PolymorphicRoutes
        collection pluralize(tile), ->
          model tile, -> form "edit"
      namespace "build", ->
        for tile in PolymorphicRoutes
          collection pluralize(tile), -> form "new"
      view "destroy"

    namespace "worker", ->
      collection "appointments", ->
        form "new"
        view "search"
        model "appointment", ->
          form "edit"
          collection "batches", ->
            form "new"
          collection "companies", ->
            form "new"
          collection "histories"
          collection "trucks"
          collection "weightickets"
        collection "companies", ->
          form "new"

      collection "batches", ->
        model "batch", ->
          form "edit"
          collection "histories"
          collection "pictures", ->
            form "new"

      collection "cells", ->
        model "cell", ->
          form "edit"
          collection "histories"

      collection "docks", ->
        model "dock", ->
          collection "batches", ->
            form "new"

      collection "employees", ->
        model "employee"

      collection "reports", ->
        form "new"
        model "report"

      collection "scales", ->
        model "scale"

      collection "trucks", ->
        model "truck", ->
          form "edit"
          collection "histories"

      model "weighticket", ->
        form "edit"

`export {Router, PolymorphicRoutes}`
`export default Router`
