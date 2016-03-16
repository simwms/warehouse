`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'nav-tab', 'Integration | Component | nav tab', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{nav-tab}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#nav-tab}}
      template block text
    {{/nav-tab}}
  """

  assert.equal @$().text().trim(), 'template block text'
