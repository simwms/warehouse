`import Ember from 'ember'`
`import RouteTileLineFindersMixin from '../../../mixins/route-tile-line-finders'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | route tile line finders'

# Replace this with your real tests.
test 'it works', (assert) ->
  RouteTileLineFindersObject = Ember.Object.extend RouteTileLineFindersMixin
  subject = RouteTileLineFindersObject.create()
  assert.ok subject
