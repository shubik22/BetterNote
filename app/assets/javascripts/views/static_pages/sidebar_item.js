BetterNote.Views.SidebarItem = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "add change remove", this.render);
    this.listenTo(this.model.notes, "add remove", this.render);
  },

  tagName: "li",
  className: "group dropdown-parent",
  template: JST['static_pages/sidebar_item'],

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    if (BetterNote.featuredNotes.id === this.model.get("id")) {
      this.$el.addClass("selected");
    }

    this.$el.html(renderedContent);
    return this;
  }
});