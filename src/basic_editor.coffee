class window.Editor
  @active = ->
    current = @el().html()
    textarea = $('<textarea/>')
    textarea.html(current)
    @el().html(textarea)

  @commitAll = ->
    id = @el().data('id')
    model = FrontendEditor.getCurrentModel(id)
    model.id = id
    model.set(@el().data('attribute'), @el().find('textarea').html())

  @deactive = ->
    @el().html(@el().find('textarea').html())

  @el = ->
    $('.editable-long-text')
