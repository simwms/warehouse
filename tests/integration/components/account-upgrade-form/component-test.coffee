`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'account-upgrade-form', 'Integration | Component | account upgrade form', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{account-upgrade-form}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#account-upgrade-form}}
      template block text
    {{/account-upgrade-form}}
  """

  assert.equal @$().text().trim(), 'template block text'
