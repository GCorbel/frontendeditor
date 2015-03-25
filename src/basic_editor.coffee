class window.Editor
  @active = ->
    $.each @el(), ->
      element = $(this)
      current = element.html()
      textarea = $('<textarea/>')
      textarea.html(current)
      element.html(textarea)

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
    $.each @el(), ->
      element = $(this)
      element.html(element.find('textarea').val())

  @el = ->
    $('.editable-long-text')
