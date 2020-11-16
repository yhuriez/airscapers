


import 'KeyValueStorage.dart';

// Needed to make conditional import work
KeyValueStorage getStorage() => throw UnsupportedError(
    "Do not call this function, import from storage/web or storage/mobile in function of dart:io or dart:html availability");
