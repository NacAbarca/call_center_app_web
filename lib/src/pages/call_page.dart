import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _roomController = TextEditingController(text: "testroom");
  final _nameController = TextEditingController(text: "Usuario Sordo");

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

    void _joinMeeting() async {
      try {
        /// Aquí es importante pasar serverURL para Web
        var options = JitsiMeetingOptions(
          room: _roomController.text,
        )
          ..serverURL = 'https://meet.jit.si'       // <<— añade esta línea
          ..userDisplayName = _nameController.text
          ..audioMuted = false
          ..videoMuted = false
          ..audioOnly = false
          ..featureFlags.addAll({
            FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
          });

        debugPrint("Abriendo Jitsi con options: $options");
        await JitsiMeet.joinMeeting(options);
      } catch (error) {
        debugPrint("Error al unir a la reunión: $error");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Videollamada LSCh")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _roomController,
              decoration: const InputDecoration(labelText: "ID de la sala"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Tu nombre"),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.video_call),
              label: const Text("Unirse a la llamada"),
              onPressed: _joinMeeting,
            ),
          ],
        ),
      ),
    );
  }
}
