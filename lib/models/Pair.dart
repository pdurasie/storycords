class Pair<A, B> {
  final A first;
  final B second;

  const Pair(this.first, this.second);

  @override
  String toString() => '$runtimeType: $first, $second';
}
