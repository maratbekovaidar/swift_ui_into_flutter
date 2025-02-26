import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Platform views in Flutter come with performance trade-offs.
///
/// For complex cases, there are some techniques that can be
/// used to mitigate performance issues.
///
/// For example, you could use a placeholder texture while an animation is happening in Dart.
///
/// In other words, if an animation is slow while a platform view is rendered,
/// then consider taking a screenshot of the native view and rendering it as a texture.

const mySwiftUIView = 'MySwiftUIView';

class IosScreen extends StatefulWidget {
  const IosScreen({super.key});

  @override
  State<IosScreen> createState() => _IosScreenState();
}

class _IosScreenState extends State<IosScreen> {
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: UiKitView(
              viewType: mySwiftUIView,
              layoutDirection: TextDirection.ltr,
              creationParams: null,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                print('Button pressed');
              },
              child: const Text('Press me'),
            ),
          )
        ],
      ),
    );
  }
}
