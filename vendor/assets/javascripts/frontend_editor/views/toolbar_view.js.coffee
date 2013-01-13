FrontendEditor.Views.InlineEditor ||= {}

class FrontendEditor.Views.InlineEditor.ToolbarView extends Backbone.View

  template: JST['frontend_editor/templates/toolbar_views']

  events:
    'click .editing-mode': 'toggle_editing_mode'
    'click .save': 'save_changes'
    'click .cancel': 'cancel_changes'

  render: ->
    super
    if $('#frontend_toolbar').length != 0
      $(@el).html($('#frontend_toolbar').html())
    else
      $(@el).html(@template())

    @$('.save').hide()
    @$('.cancel').hide()
    @

# commit all changes for all stored model
  save_changes: (event) ->
    Editor.commitAll()
    FrontendEditor.currentModels.save()
    FrontendEditor.currentModels.reset()

# reload the page to cancel all change
  cancel_changes: (event) ->
    window.location.reload()

# toggle the editing mode
  toggle_editing_mode: ->
    if $('.save').is(':hidden')
      @$('.save').show()
      @$('.cancel').show()
      Editor.active()
    else
      @$('.save').hide()
      @$('.cancel').hide()
      Editor.deactive()
