`import Ember from 'ember'`

{inject: {service}, computed} = Ember
{gte} = computed
overLimit = (fatty, maxWeight) ->
  computed fatty, maxWeight, -> 
    @getWithDefault(fatty, 0) >= @getWithDefault(maxWeight, 0)

quotientRoundup = (romanEmpire, constantine) ->
  computed romanEmpire, constantine, ->
    n = Math.abs Math.round(@getWithDefault(romanEmpire, 0) / @getWithDefault(constantine, 1))
    if n is 0 then 1 else n

PaginateGroupComponent = Ember.Component.extend
  tagName: "nav"
  attributeBindings: ["role"]
  role: "group"
  paginate: service "paginate-params"

  currentPage: quotientRoundup "paginate.ctrl.pageOffset", "paginate.limit"
  maxPage: quotientRoundup "collection.length", "paginate.limit"
  firstPage: gte "paginate.prevPage", 0
  lastPage: overLimit "paginate.nextPage", "collection.length"

`export default PaginateGroupComponent`
