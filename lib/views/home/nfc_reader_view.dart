


import 'dart:convert';
import 'dart:io';

import 'package:airscaper/domain/usecases/link_use_cases.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:airscaper/views/navigation/navigation_methods.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcReaderView extends StatefulWidget {

  @override
  State<NfcReaderView> createState() => _NfcReaderViewState();
}

class _NfcReaderViewState extends State<NfcReaderView> with WidgetsBindingObserver {

  bool isAvailable = true;
  bool isScanning = (Platform.isAndroid);
  bool isReading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    refreshNfc();
  }

  @override
  Widget build(BuildContext context) {

    late Widget child;

    if (!isAvailable) {
      child = NfcDisabledView();

    } else if (isScanning) {
      child = NfcReadWaitingView();

    } else {
      child = NfcActivationView(onTap: startScan);
    }

    return Center(child: child);
  }

  refreshNfc () async {
    // Check availability
    final availability = await NfcManager.instance.isAvailable();
    setState(() {
      isAvailable = availability;
    });

    // Start Session
    if(availability && isScanning) {
      print("Refresh NFC scanning...");
      NfcManager.instance.startSession(
          onDiscovered: _onTagDiscovered
      );
    }
  }

  startScan() {
    print("Start NFC scanning...");
    NfcManager.instance.startSession(
        onDiscovered: _onTagDiscovered
    );
    setState(() {
      isScanning = true;
    });
  }

  stopScan() {
    print("Stopped NFC scanning.");
    NfcManager.instance.stopSession();
    setState(() {
      isScanning = false;
    });
  }

  Future<void> _onTagDiscovered(NfcTag tag) async {

    setState(() {
      isReading = true;
    });

    final ndefTag = Ndef.from(tag);

    try {

      final result = await ndefTag?.read();

      var record = result?.records.first;

      if (record != null) {
        final languageCodeLength = record.payload.first;
        final nextLink = utf8.decode(record.payload.sublist(1 + languageCodeLength));

        print("Tag discovered : $nextLink");

        parseLink(context, nextLink);
      } else {
        setState(() {
          isReading = false;
        });
      }

    } catch (e, stack) {
      print(stack);
      setState(() {
        isReading = false;
      });
    }
  }

  parseLink(BuildContext context, String? scanResult) async {
    final link = sl<ParseLinkUseCase>().execute(scanResult);

    NavigationIntent? nextIntent;
    if (link != null) {
      nextIntent = sl<InterpretLinkUseCase>().execute(link);

    } else {
      nextIntent = NavigationIntent.dialog(arguments: DialogArguments(
          "Code invalide", "Ce code n'existe pas dans l'application"));
    }

    setState(() {
      isReading = false;
    });

    if(Platform.isIOS) {
      stopScan();
    }

    await navigateTo(context, nextIntent);
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      print("Stopped NFC reader from lifecycle");
      NfcManager.instance.stopSession();

    } else if(state == AppLifecycleState.resumed) {
      print("Resumed NFC reader from lifecycle, refresh NFC");
      refreshNfc();
    }
  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
    WidgetsBinding.instance?.removeObserver(this);
  }
}

class NfcReadWaitingView extends StatelessWidget {
  const NfcReadWaitingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingAnimationWidget.beat(color: Colors.white, size: 150.0),

        SizedBox(height: 80,),

        Text(
            "Passez l'appareil devant un marqueur pour le visualiser",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
        )
      ],
    );
  }
}

class NfcActivationView extends StatelessWidget {

  final Function() onTap;

  const NfcActivationView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(80),
          onTap: onTap,
          child: Ring.draw(
            color: Colors.white,
            size: 150,
            strokeWidth: 30,
          ),
        ),

        SizedBox(height: 80,),

        Text(
            "Appuyer sur le cercle pour commencer le scan",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
        )
      ],
    );
  }
}

class NfcDisabledView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            "Activez le NFC sur l'appareil pour pouvoir utiliser l'application",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)
        ),

        SizedBox(height: 36,),

        ARSButton(onClick: onActivateNfc,
          text: Text("Activer", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
          backgroundColor: Colors.green,)
      ],
    );
  }

  onActivateNfc(BuildContext context) {
    AppSettings.openNFCSettings();
  }
}


class Ring extends CustomPainter {
  final Color _color;
  final double _strokeWidth;

  Ring(
      this._color,
      this._strokeWidth,
      );

  static Widget draw({
    required Color color,
    required double size,
    required double strokeWidth,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: Ring(
            color,
            strokeWidth,
          ),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


