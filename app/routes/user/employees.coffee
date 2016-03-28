`import Ember from 'ember'`

UserEmployeesRoute = Ember.Route.extend
  model: ->
    @modelFor "user"
    .get "employees"
    .then (employees) ->
      employees.rejectBy "role", "superadmin"

`export default UserEmployeesRoute`