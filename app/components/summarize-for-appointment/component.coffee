`import Ember from 'ember'`
`import {isLive} from 'warehouse/utils/process-query'`
`import moment from 'moment'`
{computed} = Ember
{alias} = computed
SummarizeForAppointmentComponent = Ember.Component.extend
  tagName: ""
  appointment: alias "model"
  modelPath: alias "meta.modelPath"
  fields: alias "meta.fields"
  appointmentStatusClass: computed "appointmentStatus", ->
    switch @get "appointmentStatus"
      when "live" then "list-group-item-success"
      when "planned" then "list-group-item-info"
      when "dead" then ""
      when "stale" then "list-group-item-warning"
      else "list-group-item-warning"

  appointmentStatus: computed "appointment.goliveAt", "appointment.unliveAt", ->
    appointment = @get("appointment")
    today = moment()
    yesterday = moment().startOf("day")
    switch
      when isLive(appointment) and appointment.get("goliveAt") < yesterday then "stale"
      when isLive(appointment) then "live"
      when appointment.get("goliveAt") < today then "planned"
      when appointment.get("unliveAt") > today then "dead"
      else "unknown"

`export default SummarizeForAppointmentComponent`
