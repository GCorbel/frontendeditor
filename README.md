# Frontendeditor

This is a front end editor for rails applications. It must be used with frontendeditor_ckeditor.

## Installation

Add this line to your application's Gemfile:

    gem 'frontendeditor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frontendeditor

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Note for contributors

I use this command to generate `frontend_editor.js` :

    coffee -j vendor/assets/javascripts/frontend_editor/frontend_editor.js -wc src/frontend_editor.coffee src/models/item.js.coffee src/views/toolbar_view.js.coffee src/collections/items.js.coffee

And this one to generate `basic_editor.js` :

    coffee -j vendor/assets/javascripts/frontend_editor/basic_editor.js -wc src/basic_editor.coffee
