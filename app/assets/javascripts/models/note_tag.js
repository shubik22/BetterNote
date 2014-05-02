BetterNote.Models.NoteTag = Backbone.Model.extend({
  urlRoot: '/api/note_tags',

  parse: function(jsonNoteTag) {
    var tag = BetterNote.tags.get(jsonNoteTag.tag_id);
    var note = BetterNote.notes.get(jsonNoteTag.note_id);
    tag.notes.add(note);
    note.noteTags.add(this);
    return jsonNoteTag;
  }
});