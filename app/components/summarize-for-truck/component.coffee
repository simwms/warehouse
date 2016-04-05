`import Ember from 'ember'`
`import _x from 'autox/utils/xdash'`
`import {isLive} from 'warehouse/utils/process-query'`
`import moment from 'moment'`

{computed} = Ember
{alias} = computed
{computed: {computedTask}} = _x

SummarizeForTruckComponent = Ember.Component.extend
  tagName: ""
  truck: alias "model"
  modelPath: alias "meta.modelPath"
  fields: alias "meta.fields"
  truckStatusClass: computed "truckStatus", ->
    switch @get "truckStatus"
      when "onsite" then "list-group-item-success"
      when "planned" then "list-group-item-info"
      when "dead", "departed", "expected" then ""
      when "late" then "list-group-item-warning"
      when "unknown" then "list-group-item-danger"
      else ""

  truckEventLength: computedTask "truck.histories.length", ->
    @get("truck").get("histories").then (histories) -> histories?.get("length")

  truckStatus: computedTask "truck.goliveAt", "truck.unliveAt", "truck.historyStatus", ->
    truck = @get("truck")
    today = moment()
    yesterday = moment().startOf("day")
    switch
      when isLive(truck) and @get("truck.historyStatus") is "truck-exit-site" then "departed"
      when isLive(truck) and @get("truckEventLength") > 0 then "onsite"
      when isLive(truck) and truck.get("goliveAt") < yesterday then "late"
      when isLive(truck) then "expected"
      when truck.get("goliveAt") < today then "planned"
      when truck.get("unliveAt") > today then "dead"
      else "unknown"

`export default SummarizeForTruckComponent`
