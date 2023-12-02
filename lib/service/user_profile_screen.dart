import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/main.dart';
import 'package:river_pod/service/authentication/authentication.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _user = ref.read(authenticationProvider);
    var bottomItem = ref.read(bottomSelectedIndex);
    return StreamBuilder(
        stream: _user.authStateChange,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();
          return Stack(
            children: [
              Image.network(
                snapshot.data?.photoURL ?? "",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data?.displayName ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          snapshot.data?.email ?? "",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.verified,
                          color: Colors.purpleAccent,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data?.phoneNumber ?? "",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () async {
                            await _user.signOut().then((value) {
                              ref.read(selectedScreen.notifier).state = 0;
                              ref.read(bottomSelectedIndex.notifier).state = 0;
                            });
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                decorationColor: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
