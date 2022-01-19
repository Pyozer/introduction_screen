class Position {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  const Position({this.left, this.right, this.top, this.bottom});

  const Position.fromLTRB(this.left, this.top, this.right, this.bottom);
}
