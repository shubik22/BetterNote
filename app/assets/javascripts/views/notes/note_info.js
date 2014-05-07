BetterNote.Views.NoteInfo = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model.likes, "add remove", this.render);
    
    if (!this.model.friendNote) {
      this.listenTo(this.model.noteTags, "add remove", this.render);
    }
  },

  template: JST['notes/info'],
  tagName: "table",
  className: "note-info options-dropdown hidden",

  events: {
    "click .dropdown-parent": "showDropdown",
    "click .options-dropdown": "stopPropagation"
  },

  render: function() {
    var renderedContent = this.template({
      note: this.model,
      notebooks: BetterNote.notebooks
    });

    this.$el.html(renderedContent);
    return this;
  },

  showDropdown: function(event) {
    event.preventDefault();
    this.hideDropdowns();

    var $dropdown = $(event.currentTarget).find(".options-dropdown");
    $dropdown.removeClass("hidden");
  },

  hideDropdowns: function(event) {
    $(".options-dropdown").not("hidden").addClass("hidden");
  },

  stopPropagation: function(event) {
    event.stopPropagation();
  },
});