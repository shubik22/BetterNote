BetterNote.Views.NavBar = Backbone.View.extend({
  tagName: "header",
  className: "main group",
  template: JST['static_pages/navbar'],

  events: {
    "click .nav-right-item": "showDropdown",
    "click .options-dropdown, .nav-right-item": "stopPropagation",
    "click .about": "showModal"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  showDropdown: function(event) {
    event.preventDefault();

    var $dropdown = $(event.currentTarget).find(".options-dropdown");
    $dropdown.removeClass("hidden");
  },

  hideDropdowns: function(event) {
    $(".options-dropdown").not("hidden").addClass("hidden");
  },

  stopPropagation: function(event) {
    event.stopPropagation();
  },

  showModal: function(event) {
    event.preventDefault();

    var view = new BetterNote.Views.About();
    var $modal = $("#modal");
    var $modalContent = $(".modal-content")

    $modal.removeClass("hidden");
    $modalContent.html(view.render().$el);
  },

  closeModal: function(event) {
    event.preventDefault();

    var $modal = $("#modal");
    var $modalContent = $(".modal-content")

    $modal.addClass("hidden");
    $modalContent.html("");
  }
});