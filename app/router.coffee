`import Ember from 'ember'`
`import config from './config/environment'`
`import {DSL} from 'autox'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  {namespace, collection, model, form, view} = DSL.import @

  @route "register"

  namespace "user", ->
    collection "accounts", ->
      form "new"
    collection "employees"

  namespace "warehouse", ->
    namespace "admin", ->
      collection "employees", ->
        form "new"
        model "employee"

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

      collection "scales", ->
        model "scale"

      collection "trucks", ->
        model "truck", ->
          form "edit"
          collection "histories"

      model "weighticket", ->
        form "edit"

`export default Router`
