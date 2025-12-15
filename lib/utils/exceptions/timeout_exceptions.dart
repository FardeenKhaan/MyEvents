class FkTimeoutException implements Exception {
  final String message;

  FkTimeoutException(this.message);

  factory FkTimeoutException.fromDuration(Duration duration) {
    return FkTimeoutException('The operation timed out after ${duration.inSeconds} seconds.');
  }

  @override
  String toString() {
    return 'Timeout: $message';
  }
}
