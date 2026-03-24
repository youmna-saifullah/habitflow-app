/// Immutable entity that describes an image asset and metadata.
class ImageInfoEntity {
  /// Creates an image information entity.
  const ImageInfoEntity({
    required this.path,
    required this.semanticLabel,
    this.width,
    this.height,
  });

  /// Asset path of the image.
  final String path;

  /// Accessibility label for screen readers.
  final String semanticLabel;

  /// Optional image width.
  final double? width;

  /// Optional image height.
  final double? height;
}
