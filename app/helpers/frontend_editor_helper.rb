module FrontendEditorHelper
  def editable(model, options)
    id = model.id
    options[:method] ||= 'body'
    options[:class_name] ||= model.class.name.demodulize.pluralize.downcase
    options[:content] ||= model.send(method)

    content_tag(:div,
      class: 'editable-long-text',
      data: {
        object: options[:class_name],
        id: options[:id],
        attribute: options[:method]
      } ) do

      raw(options[:content])
    end
  end
end
