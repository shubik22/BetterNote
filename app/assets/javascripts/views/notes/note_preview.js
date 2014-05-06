BetterNote.Views.NotePreview = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.removeNote);
  },

  template: JST['notes/preview'],
  tagName: "li",

  render: function() {
    var renderedContent = this.template({
      note: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },
  
  removeNote: function() {
    if (this.$el.next().length > 0) {
      this.$el.next().find("article").addClass("selected");
    } else if (this.$el.prev().length > 0) {
      this.$el.prev().find("article").addClass("selected");
    }
    
    this.remove();
  }
});