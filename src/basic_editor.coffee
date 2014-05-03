class window.Editor
  @active = ->
    current = $('.editable-long-text').html()
    textarea = $('<textarea/>')
    textarea.html(current)
    $('.editable-long-text').html(textarea)

  @commitAll = ->
    id = $('.editable-long-text').data('id')
    model = FrontendEditor.getCurrentModel(id)
    model.id = id
    model.set($('.editable-long-text').data('attribute'), $('.editable-long-text textarea').html())

  @deactive = ->
    $('.editable-long-text').html($('.editable-long-text textarea').html())

  @el = ->
    $('.editable-long-text')
