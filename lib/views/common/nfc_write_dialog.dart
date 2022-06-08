import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/common/ars_dialog_base.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcWriteDialog extends StatefulWidget {

  final String link;

  const NfcWriteDialog({Key? key, required this.link}) : super(key: key);

  @override
  State<NfcWriteDialog> createState() => _NfcWriteDialogState();
}

class _NfcWriteDialogState extends State<NfcWriteDialog> {

  bool writeSuccess = false;
  String? writeError;

  @override
  void initState() {
    super.initState();

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {

        setState(() {
          this.writeError = "Le tag n'est pas compatible Ndef";
        });

        return;
      }

      NdefMessage message = NdefMessage([
        NdefRecord.createText(widget.link),
      ]);

      try {
        await ndef.write(message);
        setState(() {
          writeSuccess = true;
        });

      } catch (e, stack) {

        print(stack);

        setState(() {
          writeError = "Exception : $e";
        });
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    String displayedText = "Scanner le tag NFC pour le réécrire avec le lien vers l'élément";

    if(writeSuccess) displayedText = "Ecriture réussie !";

    if(writeError != null) displayedText = writeError!;

    return ARSDialogBase(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(displayedText),
            ),

            SizedBox(height: 16,),

            ARSButton(backgroundColor: Colors.green, onClick: onBack, text: Text("Retour", style: TextStyle(color:Colors.white),))
          ],
        ));
  }

  onBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    // NfcManager.instance.stopSession();
  }
}
