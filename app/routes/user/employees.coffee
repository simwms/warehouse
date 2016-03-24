`import Ember from 'ember'`

UserEmployeesRoute = Ember.Route.extend
  model: ->
    @modelFor "user"
    .get "employees"

`export default UserEmployeesRoute`