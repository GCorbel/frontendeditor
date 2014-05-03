FrontendEditor.Collections.InlineEditor ||= {}

class FrontendEditor.Collections.InlineEditor.Items extends Backbone.Collection
  model: FrontendEditor.Collections.InlineEditor.Item

  save: ->
    @each((model) -> model.save())

  prefix: (prefix) ->
    @each((model) -> model.prefix(prefix))
