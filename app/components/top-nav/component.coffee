`import Ember from 'ember'`

TopNavComponent = Ember.Component.extend
  tagName: "nav"
  classNames: ["navbar", "navbar-inverse"]
  xession: Ember.inject.service()
`export default TopNavComponent`
