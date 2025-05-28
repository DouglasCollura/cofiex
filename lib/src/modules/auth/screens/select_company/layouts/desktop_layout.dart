import 'package:cofiex/src/config/theme/app_theme.dart';
import 'package:cofiex/src/shared/helpers/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DesktopLayout extends StatelessWidget {
  final List<Map<String, dynamic>> companies;

  const DesktopLayout({
    super.key,
    required this.companies,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selecciona una Empresa',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.appBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Elige la empresa con la que deseas iniciar sesión',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.appGray,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      final company = companies[index];
                      return Card(
                        elevation: 2,
                        color: AppTheme.appLightBlueWidget,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            if(kIsWeb){
                              context.replace('/home');
                            }else{
                              NavigationHelper.replaceWithUrl(context, '/home');
                            }
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppTheme.appBlue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.business,
                                      color: AppTheme.appBlue,
                                      size: 32,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        company['name'],
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          color: AppTheme.appBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        company['description'],
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: AppTheme.appGray,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppTheme.appGray,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
} 