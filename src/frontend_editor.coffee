#= require_self
#= require_tree ./templates/
#= require_tree .//models
#= require_tree .//views
#= require_tree .//collections

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
  findCurrentOrCreateModel: (objectName, id) ->
    #Find the model
    currentModel = @currentModels.findWhere
      objectName: objectName
      id: id

    #If the model is not found
    if currentModel == undefined
      #Create a new own
      currentModel = new @Models.Item()
      #Add It to the list
      @currentModels.add(currentModel)
    #Return the model
    currentModel
