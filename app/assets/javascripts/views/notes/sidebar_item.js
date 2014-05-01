BetterNote.Views.SidebarItem = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "add change remove", this.render);
    this.listenTo(this.model.notes, "add change remove", this.render);
  },

  tagName: "li",
  className: "group dropdown-parent",

  template: JST['notes/sidebar_item'],

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }
});