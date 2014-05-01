BetterNote.Views.Sidebar = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(BetterNote.notebooks, "add change remove", this.render);
    this.listenTo(BetterNote.tags, "add change remove", this.render);
    this.listenTo(BetterNote.notes, "add change remove", this.render);
  },

  template: JST['notes/sidebar'],

  events: {
    "click .sidebar-header-left": "toggleList",
    "click .sidebar-entry-left": "selectEntry",
    "click i.dropdown": "showDropdown",
    "click .options-dropdown, i.dropdown": "stopPropagation",
    "click .show-modal": "showModal"
  },

  render: function() {
    var renderedContent = this.template({
      notes: BetterNote.notes,
      tags: BetterNote.tags
    });

    $("html").on("click", this.hideDropdowns);
    $("html").on("click", ".close-modal", this.closeModal);

    this.$el.html(renderedContent);
    var that = this;
    BetterNote.notebooks.each(function(notebook) {
      var notebookView = new BetterNote.Views.SidebarItem({
        model: notebook
      });
      that.$el.find(".sidebar-list").first().append(notebookView.render().$el);
    })

    return this;
  },

  toggleList: function(event) {
    var $sidebarList = $(event.currentTarget).closest(".sidebar-item")
                          .find(".sidebar-list");
    var $icon = $(event.currentTarget).find("i:first-of-type");

    if ($sidebarList.hasClass("hidden")) {
      $sidebarList.removeClass("hidden");
      $icon.removeClass('fa-caret-right').addClass('fa-caret-down')
    } else {
      $sidebarList.addClass("hidden")
      $icon.removeClass('fa-caret-down').addClass('fa-caret-right')
    }
  },

  selectEntry: function(event) {
    $(".selected").removeClass("selected");

    var $entry = $(event.currentTarget).closest("li");
    $entry.addClass("selected");
  },

  showDropdown: function(event) {
    event.preventDefault();
    this.hideDropdowns();

    var $dropdown = $(event.currentTarget).closest(".dropdown-parent")
                      .find(".options-dropdown");
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

    var $modal = $("#modal");
    var $modalContent = $(".modal-content")
    var view = this._modalContent(event);

    $modal.removeClass("hidden");
    $modalContent.html(view.render().$el);
  },

  closeModal: function(event) {
    event.preventDefault();

    var $modal = $("#modal");
    var $modalContent = $(".modal-content")

    $modal.addClass("hidden");
    $modalContent.html("");
  },

  _modalContent: function(event) {
    var action = $(event.currentTarget).attr("data-action");
    var itemId = $(event.currentTarget).attr("data-item-id");

    switch(action) {
      case "create-notebook":
        var view = new BetterNote.Views.NotebookForm({
          model: new BetterNote.Models.Notebook(),
          $modal: $("#modal")
        });
        break;
      case "edit-notebook":
        var view = new BetterNote.Views.NotebookForm({
          model: BetterNote.notebooks.get(itemId),
          $modal: $("#modal")
        });
        break;
      case "delete-notebook":
        var view = new BetterNote.Views.NotebookDelete({
          model: BetterNote.notebooks.get(itemId),
          $modal: $("#modal")
        });
        break;
      case "create-tag":
        var view = new BetterNote.Views.TagForm({
          model: new BetterNote.Models.Tag(),
          $modal: $("#modal")
        });
        break
      case "edit-tag":
        var view = new BetterNote.Views.TagForm({
          model: BetterNote.tags.get(itemId),
          $modal: $("#modal")
        });
        break;
      case "delete-tag":
        var view = new BetterNote.Views.TagDelete({
          model: BetterNote.tags.get(itemId),
          $modal: $("#modal")
        });
        break;
      }
    return view;
  }
});