class window.Editor
  @active = ->
    current = @el().html()
    textarea = $('<textarea/>')
    textarea.html(current)
    @el().html(textarea)

  @commitAll = ->
    objectName = @el().data('object')
    model = FrontendEditor.findCurrentOrCreateModel(objectName)
    values = id: @el().data('id')
    values[@el().data('attribute')] = @el().find('textarea').val()

    attributes =
      values: values
      prefix: @el().data('prefix')
      objectName: objectName
    model.setAttributes(attributes)

  @deactive = ->
    @el().html(@el().find('textarea').val())

  @el = ->
    $('.editable-long-text')
