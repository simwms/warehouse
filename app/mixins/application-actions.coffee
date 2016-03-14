`import Ember from 'ember'`

Actions =
  selectAccount: (account) ->
    @xession.update {account}
    .then =>
      @transitionTo "warehouse"
  login: ->
    @xession.login()
    .then => @refresh() 
  logout: ->
    @xession.logout()
    .then => @refresh()
  register: (user) ->
    console.log user

ApplicationActionsMixin = Ember.Mixin.create Actions

`export default ApplicationActionsMixin`
`export {Actions, ApplicationActionsMixin}`
