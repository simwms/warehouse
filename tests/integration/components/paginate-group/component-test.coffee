`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'paginate-group', 'Integration | Component | paginate group', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{paginate-group}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#paginate-group}}
      template block text
    {{/paginate-group}}
  """

  assert.equal @$().text().trim(), 'template block text'
