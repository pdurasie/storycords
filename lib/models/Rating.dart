class Rating {
  int get total {
    return upvotes + downvotes;
  }

  int upvotes = 0;
  int downvotes = 0;

  Rating(this.upvotes);
}
