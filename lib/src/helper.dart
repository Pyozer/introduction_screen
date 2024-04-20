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

bool isBackgroundImageAssetPathValid(String assetPath) {
  const validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];

  bool hasValidExtension = validExtensions.any((extension) {
    return assetPath.toLowerCase().endsWith('.$extension');
  });

  if (!hasValidExtension) {
    return false;
  }

  return true;
}
