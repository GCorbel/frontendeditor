module FrontendEditorHelper
  def editable(model, options = {})
    options[:id] ||= model.id
    options[:method] ||= 'body'
    options[:object] ||= model.class.name.demodulize.pluralize.downcase

    content_tag(:div,
      class: 'editable-long-text',
      data: {
        object: options[:object],
        id: options[:id],
        attribute: options[:method]
      } ) do

      raw(yield)
    end
  end
end
