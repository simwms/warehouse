`import Ember from 'ember'`

## Check out the original LinkComponent here:
# https://github.com/emberjs/ember.js/blob/v2.4.0/packages/ember-routing-views/lib/components/link-to.js#L330
NavTabComponent = Ember.LinkComponent.extend
  tagName: "li"

NavTabComponent.reopenClass
  positionalParams: "params"

`export default NavTabComponent`
