`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'modal-footer', 'Integration | Component | modal footer', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{modal-footer}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#modal-footer}}
      template block text
    {{/modal-footer}}
  """

  assert.equal @$().text().trim(), 'template block text'
