`import Ember from 'ember'`

UserAccountsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord "account",
      user: @modelFor "user"

  modelCreated: ->
    @controllerFor "user.accounts.new"
    .get "model"
    .get "employees"
    .get "firstObject"
    .then (employee) =>
      @send "selectEmployee", employee

`export default UserAccountsNewRoute`