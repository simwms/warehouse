`import Ember from 'ember'`

# This function receives the params `params, hash`
at = ([array, i]) ->
  return array[i]

AtHelper = Ember.Helper.helper at

`export { at }`

`export default AtHelper`
