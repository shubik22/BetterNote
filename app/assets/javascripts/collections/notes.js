BetterNote.Collections.Notes = Backbone.Collection.extend({

  model: BetterNote.Models.Note,

  url: "/api/notes",

  nextNote: function(note) {
    var noteIndex = this.indexOf(note);
    var nextIndex = (noteIndex < this.length - 1) ? noteIndex + 1 : noteIndex - 1
    return this.at(nextIndex);
  },

  comparator: function(note1, note2) {
    if (note1.isNew()) {
      return -1
    } else if (note2.isNew()) {
      return 1
    };

    if (note1.get("created_at") > note2.get("created_at")) {
      return -1;
    } else if (note1.get("created_at") < note2.get("created_at")) {
      return 1;
    } else {
      return 0;
    }
  }
});