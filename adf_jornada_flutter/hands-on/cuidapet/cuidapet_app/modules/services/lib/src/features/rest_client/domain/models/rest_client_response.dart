
final class RestClientResponse<T> {
T? data;
int? statusCode;
String? statusMessage;
  RestClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });
  

  RestClientResponse<T> copyWith({
    T? data,
    int? statusCode,
    String? statusMessage,
  }) {
    return RestClientResponse<T>(
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  String toString() => 'RestClientResponse(data: $data, statusCode: $statusCode, statusMessage: $statusMessage)';

  @override
  bool operator ==(covariant RestClientResponse<T> other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data &&
      other.statusCode == statusCode &&
      other.statusMessage == statusMessage;
  }

  @override
  int get hashCode => data.hashCode ^ statusCode.hashCode ^ statusMessage.hashCode;
}
