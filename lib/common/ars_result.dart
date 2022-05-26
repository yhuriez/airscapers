


class ARSResult<D> {

  final bool loading;
  final String? errorCode;
  final D? data;

  ARSResult._({this.loading = false, this.errorCode, this.data});

  ARSResult.loading() : this._(loading: true);

  ARSResult.error(String errorCode) : this._(errorCode: errorCode);

  ARSResult.success(D data) : this._(data: data);
}