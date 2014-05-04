window.BetterNote = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $content = $('.content');
    var $noteShowEl = $('.note-show');
    var $notesListEl = $('.notes-list');

    var data = JSON.parse($('#bootstrapped-data-json').html());
    this.currentUser = new BetterNote.Models.User(data.user);
    this.notebooks = new BetterNote.Collections.Notebooks(data.notebooks);
    this.tags = new BetterNote.Collections.Tags(data.tags);
    this.notes = new BetterNote.Collections.Notes(data.notes, { parse: true });

    this.featuredNote = this.notes.at(0);
    this.featuredNotes = this.notes;
    this.featuredNotes.id = "all";
    this.featuredNotebook = this.notebooks.at(0);
    this.filter = new BetterNote.Models.Filter({
      text: "",
      tags: []
    });

    this.router = new BetterNote.Routers.Notes($notesListEl, $noteShowEl);

    var sidebarView = new BetterNote.Views.Sidebar();
    var searchBarView = new BetterNote.Views.SearchBar();
    $content.prepend(sidebarView.render().$el);
    $content.prepend(searchBarView.render().$el);
    Backbone.history.start();
  }
};

$(document).ready(function(){
  BetterNote.initialize();
});