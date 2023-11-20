
class ParseLinkUseCase {
  String? execute(String? param) {
    if (param == null || param.isEmpty) return null;

    String value;
    if (param.startsWith("airscapers://")) {
      value = param.split("//").last;
    } else {
      value = param;
    }

    final splitValue = value.split("/");
    return splitValue.last;
  }
}
