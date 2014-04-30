window.BetterNote = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $sidebar = $('.sidebar');
    var $noteShowEl = $('.note-show');
    var $notesListEl = $('.notes-list');

    var data = JSON.parse($('#bootstrapped-data-json').html());
    this.notebooks = new BetterNote.Collections.Notebooks();
    this.tags = new BetterNote.Collections.Tags();
    this.notes = new BetterNote.Collections.Notes(data.notes, { parse: true });
    this.currentUser = new BetterNote.Models.User(data.user);

    new BetterNote.Routers.Notes($notesListEl, $noteShowEl);

    var sidebarView = new BetterNote.Views.Sidebar();
    $sidebar.html(sidebarView.render().$el);
    Backbone.history.start();
  }
};

$(document).ready(function(){
  BetterNote.initialize();
});