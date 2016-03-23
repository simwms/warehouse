`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

{isPresent} = Ember
{flow, partialRight, chunk} = _

bufferify = (x) ->
  switch x?.length
    when undefined, null, 0 then "00"
    when 1 then x + "0"
    when 2 then x
    else throw new Error "Expected an string of length at most 2, got: '#{x}'"

reverseChunk = (string, distance) ->
  r = string.length % distance
  head = string.substr(0, r)
  body = chunk string.substr(r)
  body.unshift(head) if isPresent(head)
  body

sepBy = (dollars, distance, separator) ->
  [integer, decimal] = dollars.toString().split(".")
  reverseChunk(integer, distance).join(separator) + "." + bufferify(decimal)

denoteCurrency = (money, currency) ->
  switch currency
    when "USD" then "$#{money} USD"
    else money

centsToCurrency = flow parseFloat,
  Math.round,
  partialRight(sepBy, 3, ","),
  partialRight(denoteCurrency, "USD")

# This function receives the params `params, hash`
cents = ([amount]) -> centsToCurrency amount

CentsHelper = Ember.Helper.helper cents

`export { cents }`

`export default CentsHelper`
