#This is a generic class for all the models
class FrontendEditor.Models.Item extends Backbone.Model
  setAttributes: (attributes) ->
    @setUrlRoot(attributes)
    @setValues(attributes.values)

  setValues: (values) ->
    for key,value of values
      @set(key, value)

  setUrlRoot: (attributes) ->
    if attributes.prefix
      @urlRoot = "#{attributes.prefix}/#{attributes.objectName}"
    else
      @urlRoot = "/#{attributes.objectName}"
