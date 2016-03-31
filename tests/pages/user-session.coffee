`import Ember from 'ember'`
`import PageObject from 'warehouse/tests/page-object'`

{$, isPresent} = Ember
{visitable, clickable, fillable, text, isVisible} = PageObject

UserSession = PageObject.create
  loginParams:
    email: "test@test.test"
    password: "password123"
  visit: visitable('/')
  isLoggedIn: ->
    
  login: ->
`export default UserSession`
