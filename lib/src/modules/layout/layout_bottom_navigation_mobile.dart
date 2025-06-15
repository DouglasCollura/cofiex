import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutBottomNavigationMobile extends StatelessWidget {
  const LayoutBottomNavigationMobile({super.key});

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

            _ButtonMenu(
              icon: Icons.folder_copy_outlined,
              isSelected: path == '/base',
              path: '/base',
            ),
            _ButtonMenu(
              icon: Icons.drive_folder_upload_outlined,
              isSelected: path == '/upload-doc',
              path: '/upload-doc',
            ),
            _ButtonMenu(
              icon: Icons.local_activity_outlined,
              isSelected: path == '/request',
              path: '/request',
            ),

            _ButtonMenu(
              icon: Icons.notifications_none_outlined,
              isSelected: path == '/notification',
              path: '/notification',
            ),
            _ButtonMenu(
              icon: Icons.business_outlined,
              isSelected: path == '/company',
              path: '/company',
            ),
            
          ],
        ),
      ),
    );
  }
}

class _ButtonMenu extends StatelessWidget {
  final IconData icon;
  final String path;
  final bool isSelected;

  const _ButtonMenu({
    required this.icon,
    required this.isSelected,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.replace(path);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isSelected ? AppTheme.appLightBlue : Colors.white,
        ),
      ),
      icon: Icon(icon, color: isSelected ? Colors.white : AppTheme.appLightBlue),
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
