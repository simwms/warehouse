`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'summarize-for-truck', 'Integration | Component | summarize for truck', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{summarize-for-truck}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#summarize-for-truck}}
      template block text
    {{/summarize-for-truck}}
  """

  assert.equal @$().text().trim(), 'template block text'
