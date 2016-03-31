`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import moduleForAcceptance from 'warehouse/tests/helpers/module-for-acceptance'`
`import UserSession from 'warehouse/tests/pages/user-session'`

moduleForAcceptance 'Acceptance: UserSession'

test 'login and logout', (assert) ->
  UserSession.login()

  andThen ->
    assert.equal currentPath(), "user.index", "we should have redirected to the login page"
    assert.equal UserSession.isLoggedIn(), true, "we should be logged in"
    UserSession.logout()

  andThen ->
    assert.equal currentPath(), "index", "we should be redirected to the logged out page"
    assert.equal UserSession.isLoggedIn(), false, "we should not be logged in"
