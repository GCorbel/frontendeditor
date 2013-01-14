module FrontendEditorHelper
  def editable(model, options = {})
    options[:id] ||= model.id
    options[:method] ||= 'body'
    options[:object] ||= model.class.name.demodulize.pluralize.downcase
    options[:content] ||= model.send(options[:method])

    content_tag(:div,
      class: 'editable-long-text',
      data: {
        object: options[:object],
        id: options[:id],
        attribute: options[:method]
      } ) do

      raw(options[:content])
    end
  end
end
