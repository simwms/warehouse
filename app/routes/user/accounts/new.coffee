`import Ember from 'ember'`

UserAccountsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "account",
      user: @modelFor "user"

  modelCreated: (model) ->
    @modelFor "user"
    .get "employees"
    .reload()
    .then (employees) ->
      employees.get("firstObject")
    .then (employee) =>
      @send "selectEmployee", employee

`export default UserAccountsNewRoute`