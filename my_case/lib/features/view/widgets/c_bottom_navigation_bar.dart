import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/features/home/navigation_bar_notifier.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends ConsumerState<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(navigationBarProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: SizedBox(
          height: 120,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            unselectedLabelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 35),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Icon(Icons.request_page, size: 30),
                ),
                label: "Requests",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message, size: 35),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 35),
                label: "Profile",
              ),
            ],
            currentIndex: index,
            onTap: (value) async {
              ref.read(navigationBarProvider.notifier).setIndex(value);
            },
          ),
        ),
      ),
    );
  }
}
