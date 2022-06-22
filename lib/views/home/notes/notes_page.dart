import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_scaffold.dart';
import 'package:airscaper/views/home/notes/notes_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  static const String routeName = "/notes";

  static final String heroTag = "notes";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => NotesPage(), settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesState(),
      child: SafeArea(
          child: ARSScaffold(
              title: "Notes",
              child: _NotesBody())),
    );
  }
}

class _NotesBody extends StatefulWidget {
  @override
  State<_NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<_NotesBody> {

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: context.read<NotesState>().notes ?? "");
  }

  @override
  Widget build(BuildContext context) {

    final state = context.read<NotesState>();

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Material(
              color: Colors.transparent,
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                minLines: 8,
                maxLines: 99,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Vos notes",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.white38),
                    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                    fillColor: Colors.transparent,
                    filled: true),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  state.updateMessage(value);
                },
              ),
            ),
          ),
        ),
        _validateTextButton(context)
      ],
    );
  }

  Widget _validateTextButton(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: ARSButton(
              text: Text(
                "Valider",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              onClick: (context) {
                context.read<NotesState>().validate();
                Navigator.of(context).pop();
              }
        ),
  );
}
