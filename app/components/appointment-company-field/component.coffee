`import Ember from 'ember'`
`import _x from 'autox/utils/xdash'`

{tapLog} = _x
{$, inject: {service}} = Ember

AppointmentCompanyFieldComponent = Ember.Component.extend
  store: service "store"

  createNewCompany: ->
    select = @get("currentSearchTerm")
    term = select.searchText

    @set "isBusy", true
    @get("store").createRecord "company", name: term
    .save()
    .then (company) ->
      select.actions.choose company
    .finally =>
      @set "currentSearchTerm", null
      @set "isBusy", false

AppointmentCompanyFieldComponent.reopenClass
  positionalParams: ['formHeart']

`export default AppointmentCompanyFieldComponent`
