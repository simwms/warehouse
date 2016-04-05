`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'complex-action-manager', 'Integration | Component | complex action manager', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{complex-action-manager}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#complex-action-manager}}
      template block text
    {{/complex-action-manager}}
  """

  assert.equal @$().text().trim(), 'template block text'
