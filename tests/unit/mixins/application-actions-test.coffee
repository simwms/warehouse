`import Ember from 'ember'`
`import ApplicationActionsMixin from '../../../mixins/application-actions'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | application actions'

# Replace this with your real tests.
test 'it works', (assert) ->
  ApplicationActionsObject = Ember.Object.extend ApplicationActionsMixin
  subject = ApplicationActionsObject.create()
  assert.ok subject
