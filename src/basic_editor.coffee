class window.Editor
  @active = ->
    $.each @el(), ->
      element = $(this)
      current = element.html()
      textarea = $('<textarea/>')
      textarea.html(current)
      element.html(textarea)

  @commitAll = ->
    $.each @el(), ->
      element = $(this)
      objectName = element.data('object')
      id = element.data('id')
      model = FrontendEditor.findCurrentOrCreateModel(objectName, id)

      values =
        id: id
        objectName: objectName
      values[element.data('attribute')] = element.find('textarea').val()

      attributes =
        values: values
        prefix: element.data('prefix')
        objectName: objectName
      model.setAttributes(attributes)

  @deactive = ->
    $.each @el(), ->
      element = $(this)
      element.html(element.find('textarea').val())

  @el = ->
    $('.editable-long-text')
