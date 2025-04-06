
final class RestClientResponseModel<T> {
T? data;
int? statusCode;
String? statusMessage;
  RestClientResponseModel({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
  
  @override
  String toString() => 'RestClientResponseModel(data: $data, statusCode: $statusCode, statusMessage: $statusMessage)';

  @override
  bool operator ==(covariant RestClientResponseModel<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data &&
      other.statusCode == statusCode &&
      other.statusMessage == statusMessage;
  }

  @override
  int get hashCode => data.hashCode ^ statusCode.hashCode ^ statusMessage.hashCode;
}
