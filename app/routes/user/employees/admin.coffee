`import Ember from 'ember'`

UserEmployeesAdminRoute = Ember.Route.extend
  model: ->
    @modelFor "user"
    .get "employees"
    .then (employees) ->
      employees.filterBy "role", "superadmin"

`export default UserEmployeesAdminRoute`