enum ResourceType { Error, Success }

class DataResource<T> {
  final ResourceType type;
  final T data;
  final Exception exception;

  DataResource(this.type, {this.data, this.exception})
      : assert(exception != null || data != null);

  String get errorString {
    return 'Error : ${exception.toString()}';
  }
}
