//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require jquery.effects.highlight
//= require_self
//= require_tree ./templates/
//= require_tree .//models
//= require_tree .//views
//= require_tree .//collections

window.FrontendEditor =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  #Init the application
  init: ->
    #Create the toolbar, at the bottom
    view = new FrontendEditor.Views.InlineEditor.ToolbarView()
    #Add the view at the top of the body
    $('body').prepend(view.render().el)
    #Init all the models as an empty list
    @currentModels = new FrontendEditor.Collections.InlineEditor.Items()

  #Find or add a model to the current list
  getCurrentModel: (modelName) ->
    #Find the model
    currentModel = @currentModels[modelName]
    #If the model is not found
    if currentModel == undefined
      #Create a new own
      currentModel = new @Models.Item(modelName)
      #Add It to the list
      @currentModels.add(currentModel)
    #Return the model
    currentModel
