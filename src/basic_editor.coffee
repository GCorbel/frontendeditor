class window.Editor
  @active = ->
    current = @el().html()
    textarea = $('<textarea/>')
    textarea.html(current)
    @el().html(textarea)

  @commitAll = ->
    model = FrontendEditor.getCurrentModel('pages')
    model.set('id', @el().data('id'))
    model.set(@el().data('attribute'), @el().find('textarea').html())

  @deactive = ->
    @el().html(@el().find('textarea').html())

  @el = ->
    $('.editable-long-text')
