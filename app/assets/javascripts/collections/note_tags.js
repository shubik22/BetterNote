BetterNote.Collections.NoteTags = Backbone.Collection.extend({

  model: BetterNote.Models.NoteTag,
  url: '/api/note_tags'

});