extension CustomList<T> on List<T> {
  List<T> asReversed(bool isReverse) {
    return isReverse ? reversed.toList() : this;
  }

  T? elementAtOrNull(int index) {
    try {
      return this[index];
    } catch (_) {}
    return null;
  }
}
