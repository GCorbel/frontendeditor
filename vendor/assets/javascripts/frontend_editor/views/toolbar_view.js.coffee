FrontendEditor.Views.InlineEditor ||= {}

class FrontendEditor.Views.InlineEditor.ToolbarView extends Backbone.View

  template: JST['frontend_editor/templates/toolbar_views']

  events:
    'click .editing-mode': 'toggleEditingMode'
    'click .save': 'saveChanges'
    'click .cancel': 'cancelChanges'

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
  saveChanges: (event) ->
    Editor.commitAll()
    FrontendEditor.currentModels.save()
    FrontendEditor.currentModels.reset()
    alert "Enregistrement Effectué"
    @toggleEditingMode()

# reload the page to cancel all change
  cancelChanges: (event) ->
    window.location.reload()

# toggle the editing mode
  toggleEditingMode: ->
    if $('.save').is(':hidden')
      @$('.save').show()
      @$('.cancel').show()
      Editor.active()
    else
      @$('.save').hide()
      @$('.cancel').hide()
      Editor.deactive()
