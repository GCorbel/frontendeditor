// Generated by CoffeeScript 1.7.1
(function() {
  var _base, _base1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.FrontendEditor = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    init: function() {
      var view;
      view = new FrontendEditor.Views.InlineEditor.ToolbarView();
      $('body').prepend(view.render().el);
      return this.currentModels = new FrontendEditor.Collections.InlineEditor.Items();
    },
    getCurrentModel: function(modelName) {
      var currentModel;
      currentModel = this.currentModels[modelName];
      if (currentModel === void 0) {
        currentModel = new this.Models.Item(modelName);
        this.currentModels.add(currentModel);
      }
      return currentModel;
    }
  };

  FrontendEditor.Models.Item = (function(_super) {
    __extends(Item, _super);

    function Item() {
      return Item.__super__.constructor.apply(this, arguments);
    }

    Item.prototype.initialize = function(plural) {
      return this.urlRoot = "/" + plural;
    };

    Item.prototype.prefix = function(prefix) {
      return this.urlRoot = prefix + this.urlRoot;
    };

    return Item;

  })(Backbone.Model);

  (_base = FrontendEditor.Views).InlineEditor || (_base.InlineEditor = {});

  FrontendEditor.Views.InlineEditor.ToolbarView = (function(_super) {
    __extends(ToolbarView, _super);

    function ToolbarView() {
      return ToolbarView.__super__.constructor.apply(this, arguments);
    }

    ToolbarView.prototype.template = $('#toolbar-template').html();

    ToolbarView.prototype.events = {
      'click .editing-mode': 'toggleEditingMode',
      'click .save': 'saveChanges',
      'click .cancel': 'cancelChanges'
    };

    ToolbarView.prototype.render = function() {
      ToolbarView.__super__.render.apply(this, arguments);
      $(this.el).html($('#frontend_toolbar').html());
      this.$('.save').hide();
      this.$('.cancel').hide();
      return this;
    };

    ToolbarView.prototype.saveChanges = function(event) {
      var prefix;
      Editor.commitAll();
      prefix = Editor.el().data('prefix');
      if (prefix) {
        FrontendEditor.currentModels.prefix(prefix);
      }
      FrontendEditor.currentModels.save();
      FrontendEditor.currentModels.reset();
      alert("Enregistrement Effectué");
      return this.toggleEditingMode();
    };

    ToolbarView.prototype.cancelChanges = function(event) {
      return window.location.reload();
    };

    ToolbarView.prototype.toggleEditingMode = function() {
      if ($('.save').is(':hidden')) {
        this.$('.save').show();
        this.$('.cancel').show();
        return Editor.active();
      } else {
        this.$('.save').hide();
        this.$('.cancel').hide();
        return Editor.deactive();
      }
    };

    return ToolbarView;

  })(Backbone.View);

  (_base1 = FrontendEditor.Collections).InlineEditor || (_base1.InlineEditor = {});

  FrontendEditor.Collections.InlineEditor.Items = (function(_super) {
    __extends(Items, _super);

    function Items() {
      return Items.__super__.constructor.apply(this, arguments);
    }

    Items.prototype.model = FrontendEditor.Collections.InlineEditor.Item;

    Items.prototype.save = function() {
      return this.each(function(model) {
        return model.save();
      });
    };

    Items.prototype.prefix = function(prefix) {
      return this.each(function(model) {
        return model.prefix(prefix);
      });
    };

    return Items;

  })(Backbone.Collection);

}).call(this);