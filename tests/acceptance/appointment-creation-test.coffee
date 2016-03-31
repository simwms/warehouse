`import Ember from 'ember'`
`import { test } from 'qunit'`
`import moduleForAcceptance from 'warehouse/tests/helpers/module-for-acceptance'`
`import UserSession from 'warehouse/tests/pages/user-session'`

moduleForAcceptance 'Acceptance: AppointmentCreation',
  beforeEach: ->
    UserSession.login()
  afterEach: ->
    UserSession.logout()

test 'visiting /appointment-creation', (assert) ->
  visit '/appointment-creation'

  andThen ->
    assert.equal currentURL(), '/appointment-creation'
