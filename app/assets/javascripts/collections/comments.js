BetterNote.Collections.Comments = Backbone.Collection.extend({

  model: BetterNote.Models.Comment,
  url: '/api/comments',

  comparator: function(comment1, comment2) {
    if (comment1.isNew()) {
      return 1
    } else if (comment2.isNew()) {
      return -1
    };

    if (comment1.get("created_at") > comment2.get("created_at")) {
      return 1;
    } else if (comment1.get("created_at") < comment2.get("created_at")) {
      return -1;
    } else {
      return 0;
    }
  }
});