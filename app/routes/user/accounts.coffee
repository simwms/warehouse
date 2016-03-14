`import Ember from 'ember'`

UserAccountsRoute = Ember.Route.extend
  model: ->
    @modelFor "user"
    .get "accounts"

`export default UserAccountsRoute`