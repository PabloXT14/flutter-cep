import 'package:flutter/material.dart';
import 'package:flutter_cep/core/theme/app_colors.dart';
import 'package:flutter_cep/domain/models/cep_model.dart';
import 'package:solar_icons/solar_icons.dart';

class Address extends StatelessWidget {
  final CepModel? cepModel;

  const Address({super.key, required this.cepModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cepModel == null) {
      return SizedBox.shrink();
    }

    return Column(
      spacing: 24,
      children: [
        // HEADER
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
            ),
          ),
          child: Column(
            children: [
              Icon(
                SolarIconsBold.checkCircle,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                'CEP Encontrado!',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'Informações do endereço',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),

        // ADDRESS DETAILS
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            _InfoCard(
              icon: SolarIconsBold.mapPoint,
              color: theme.colorScheme.primary,
              title: 'CEP',
              subtitle: cepModel!.cep,
            ),

            _InfoCard(
              icon: SolarIconsBold.streetsMapPoint,
              color: theme.colorScheme.secondary,
              title: 'Logradouro',
              subtitle: cepModel!.logradouro,
            ),

            _InfoCard(
              icon: SolarIconsBold.home,
              color: theme.colorScheme.tertiary,
              title: 'Bairro',
              subtitle: cepModel!.bairro,
            ),

            _InfoCard(
              icon: SolarIconsBold.city,
              color: AppColors.success,
              title: 'Cidade',
              subtitle: cepModel!.localidade,
            ),

            _InfoCard(
              icon: SolarIconsBold.map,
              color: AppColors.warning,
              title: 'Estado',
              subtitle: cepModel!.estado,
            ),

            if (cepModel!.complemento.isNotEmpty)
              _InfoCard(
                icon: SolarIconsOutline.infoSquare,
                color: Colors.purple,
                title: 'Complemento',
                subtitle: cepModel!.complemento,
              ),

            SizedBox(height: 32),
          ],
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _InfoCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          // ICON
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 24,
              color: color,
            ),
          ),

          // INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: color,
                  ),
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
