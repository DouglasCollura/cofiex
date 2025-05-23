import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutBottomNavigation extends StatelessWidget {
  const LayoutBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    // return  BottomNavigationBar(
    //   backgroundColor: Color.fromARGB(255, 7, 105, 218),
    //   items: const [
    //     BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined, color: Colors.white,), label: '', ),
    //     BottomNavigationBarItem(icon: Icon(Icons.content_paste, color: Colors.white,), label: ''),
    //   ],
    // );
    final path = GoRouterState.of(context).path;

    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.appBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.replace('/home');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  path == '/home' ? AppTheme.appLightBlue : Colors.white,
                ),
              ),
              icon: Icon(
                Icons.folder_copy_outlined,
                color: path == '/home' ? Colors.white : AppTheme.appLightBlue,
              ),
            ),

            IconButton(
              onPressed: () {
                context.replace('/upload-doc');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  path == '/upload-doc' ? AppTheme.appLightBlue : Colors.white,
                ),
              ),
              icon: Icon(
                Icons.drive_folder_upload_outlined,
                color:
                    path == '/upload-doc'
                        ? Colors.white
                        : AppTheme.appLightBlue,
              ),
            ),

            IconButton(
              onPressed: () {
                context.replace('/request');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  path == '/request' ? AppTheme.appLightBlue : Colors.white,
                ),
              ),
              icon: Icon(
                Icons.local_activity_outlined,
                color:
                    path == '/request'
                        ? Colors.white
                        : AppTheme.appLightBlue,
              ),
            ),

            IconButton(
              onPressed: () {
                context.replace('/notification');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  path == '/notification' ? AppTheme.appLightBlue : Colors.white,
                ),
              ),
              icon: Icon(
                Icons.notifications_none_outlined,
                color:
                    path == '/notification' ? Colors.white : AppTheme.appLightBlue,
              ),
            ),

            IconButton(
              onPressed: () {
                context.replace('/company');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  path == '/company' ? AppTheme.appLightBlue : Colors.white,
                ),
              ),
              icon: Icon(
                Icons.business_outlined,
                color:
                    path == '/company' ? Colors.white : AppTheme.appLightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ButtonMenu extends StatelessWidget {
//   final IconData icon;
//   final String path;
//   final bool isSelected;

//   const _ButtonMenu({
//     required this.icon,
//     required this.isSelected,
//     required this.path,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const ButtonStyle decoratedButton = ButtonStyle(
//       backgroundColor: WidgetStatePropertyAll(Colors.white),
//     );

//     ButtonStyle decoratedButtonSelected = decoratedButton.copyWith(
//       backgroundColor: const WidgetStatePropertyAll(Color(0xff00ff98)),
//     );

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         border: Border.all(color: Colors.black12),
//       ),
//       width: 45,
//       height: 45,
//       child: IconButton(
//         onPressed: () {
//           context.replace(path);
//         },
//         icon: Icon(icon, color: isSelected ? AppTheme.appBlue : Colors.black87),
//         style: isSelected ? decoratedButtonSelected : decoratedButton,
//       ),
//     );
//   }
// }
