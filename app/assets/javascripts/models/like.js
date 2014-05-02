BetterNote.Models.Like = Backbone.Model.extend({
  initialize: function() {
    this.owner = this.owner || BetterNote.currentUser;
  },

  urlRoot: 'api/likes',

  parse: function(jsonLike) {
    if (jsonLike.owner) {
      this.owner = new BetterNote.Models.User(jsonLike.owner);
      delete jsonLike.owner;
    } else {
      this.owner = BetterNote.currentUser;
    }
    return jsonLike;
  }
});