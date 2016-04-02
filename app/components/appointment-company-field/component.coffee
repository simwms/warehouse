`import Ember from 'ember'`
{inject: {service}} = Ember

AppointmentCompanyFieldComponent = Ember.Component.extend
  store: service "store"

  createNewCompany: ->
    {searchText: name} = (term = @get "currentSearchTerm")
    store = @get "store"
    model = @get "model"
    @set "isBusy", true
    store.createRecord "company", {name}
    .save()
    .then (company) ->
      model.set "comany", company
    .finally =>
      @set "currentSearchTerm", null
      @set "isBusy", false

AppointmentCompanyFieldComponent.reopenClass
  positionalParams: ['formHeart']

`export default AppointmentCompanyFieldComponent`
