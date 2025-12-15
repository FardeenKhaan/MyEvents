import 'dart:io';

class FkSocketException implements Exception {
  final String message;

  FkSocketException(this.message);

  @override
  String toString() => message;

  factory FkSocketException.fromOsError(OSError osError) {
    switch (osError.message.toLowerCase()) {
      case 'connection refused':
        return FkSocketException('Connection refused. Please check the server settings.');
      case 'connection reset by peer':
        return FkSocketException('Connection reset by peer. Please try again.');
      case 'network unreachable':
        return FkSocketException('Network unreachable. Please check your internet connection.');
      case 'host unreachable':
        return FkSocketException('Host unreachable. Please check the server address.');
      case 'connection timed out':
        return FkSocketException('Connection timed out. Please try again later.');
      case 'address already in use':
        return FkSocketException('Address already in use. Please use a different port.');
      case 'operation now in progress':
        return FkSocketException('Operation now in progress. Please try again later.');
      case 'no route to host':
        return FkSocketException('No route to host. Please check your network configuration.');
      default:
        return FkSocketException('Check your internet connection');
    }
  }
}
