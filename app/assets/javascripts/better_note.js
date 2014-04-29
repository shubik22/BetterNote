window.BetterNote = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $sidebar = $('.sidebar');
    var $noteShowEl = $('.note-show');
    var $notesListEl = $('.notes-list');
    var notebooks = new BetterNote.Collections.Notebooks();
    var notes = new BetterNote.Collections.Notes();
    var tags = new BetterNote.Collections.Tags();

    notebooks.fetch({
      success: function() {
        notebooks.each(function(notebook) {
          notebook.notes.each(function(note){
            notes.add(note);
            if (note.tags.length > 0) {
              note.tags.each(function(tag) {
                if (tag.get(tag.get("id"))) { // if tag is in tags
                  tag.notes.add(note);
                } else {
                  tags.add(tag);
                  tag.notes = new BetterNote.Collections.Notes(note);
                }
              })
            }
          });
        });
        new BetterNote.Routers.Notebooks(notebooks, tags, notes, $notesListEl);
        new BetterNote.Routers.Notes(notebooks, notes, $noteShowEl);

        var view = new BetterNote.Views.NotebooksIndex({
          notes: notes,
          notebooks: notebooks,
          tags: tags
        });
        $sidebar.html(view.render().$el);
        Backbone.history.start();
      },
      error: function() {
        console.log("Failed to fetch.");
      }
    });
  }
};

$(document).ready(function(){
  BetterNote.initialize();
});