// Generated by CoffeeScript 1.9.0
(function() {
  window.Editor = (function() {
    function Editor() {}

    Editor.active = function() {
      return $.each(this.el(), function() {
        var current, element, textarea;
        element = $(this);
        current = element.html();
        textarea = $('<textarea/>');
        textarea.html(current);
        return element.html(textarea);
      });
    };

    Editor.commitAll = function() {
      return $.each(this.el(), function() {
        var attributes, element, id, model, objectName, values;
        element = $(this);
        objectName = element.data('object');
        id = element.data('id');
        model = FrontendEditor.findCurrentOrCreateModel(objectName, id);
        values = {
          id: id,
          objectName: objectName
        };
        values[element.data('attribute')] = element.find('textarea').val();
        attributes = {
          values: values,
          prefix: element.data('prefix'),
          objectName: objectName
        };
        return model.setAttributes(attributes);
      });
    };

    Editor.deactive = function() {
      return $.each(this.el(), function() {
        var element;
        element = $(this);
        return element.html(element.find('textarea').val());
      });
    };

    Editor.el = function() {
      return $('.editable-long-text');
    };

    return Editor;

  })();

}).call(this);
