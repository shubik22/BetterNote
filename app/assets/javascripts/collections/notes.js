BetterNote.Collections.Notes = Backbone.Collection.extend({
  model: BetterNote.Models.Note,
  url: "/api/notes",

  comparator: function(note) {
    return note.get('created_at');
  }
});