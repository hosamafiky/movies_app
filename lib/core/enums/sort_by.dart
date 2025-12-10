enum SortBy {
  originalTitleAsc('original_title.asc', 'Title A-Z'),
  originalTitleDesc('original_title.desc', 'Title Z-A'),
  popularityAsc('popularity.asc', 'Popularity ↑'),
  popularityDesc('popularity.desc', 'Popularity ↓'),
  revenueAsc('revenue.asc', 'Revenue ↑'),
  revenueDesc('revenue.desc', 'Revenue ↓'),
  primaryReleaseDateAsc('primary_release_date.asc', 'Release Date ↑'),
  primaryReleaseDateDesc('primary_release_date.desc', 'Release Date ↓'),
  titleAsc('title.asc', 'Title A-Z'),
  titleDesc('title.desc', 'Title Z-A'),
  voteAverageAsc('vote_average.asc', 'Rating ↑'),
  voteAverageDesc('vote_average.desc', 'Rating ↓'),
  voteCountAsc('vote_count.asc', 'Votes ↑'),
  voteCountDesc('vote_count.desc', 'Votes ↓');

  final String value;
  final String displayName;

  const SortBy(this.value, [this.displayName = '']);
}
