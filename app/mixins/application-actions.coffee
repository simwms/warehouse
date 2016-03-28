`import Ember from 'ember'`

Actions =
  selectEmployee: (employee) ->
    employee.get("account")
    .then (account) =>
      @xession.login {employee, account}
    .then =>
      @transitionTo "warehouse"
  login: ->
    @xession.login()
    .then => @refresh() 
  logout: ->
    @xession.logout()
    .then => @refresh()

ApplicationActionsMixin = Ember.Mixin.create Actions

`export default ApplicationActionsMixin`
`export {Actions, ApplicationActionsMixin}`
