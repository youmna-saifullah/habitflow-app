import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/snackbars/app_snackbar.dart';
import '../../../habit/presentation/providers/habit_provider.dart';

/// Form screen used to create and persist a new habit.
class AddHabitScreen extends StatefulWidget {
  /// Creates an add-habit screen.
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();

  int _targetDays = 4;
  String _selectedColorHex = '#0F766E';
  bool _isSaving = false;

  static const List<String> _palette = <String>[
    '#0F766E',
    '#1D4ED8',
    '#F97316',
    '#EF4444',
    '#9333EA',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  Future<void> _saveHabit() async {
    final FormState? formState = _formKey.currentState;
    if (formState == null || !formState.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      await context.read<HabitProvider>().addHabit(
        title: _titleController.text.trim(),
        motivation: _motivationController.text.trim(),
        colorHex: _selectedColorHex,
        targetDaysPerWeek: _targetDays,
      );

      if (!mounted) {
        return;
      }
      AppSnackbar.show(context, 'Habit created successfully');
      context.go(RouteNames.HOME);
    } catch (_) {
      if (!mounted) {
        return;
      }
      AppSnackbar.show(context, 'Failed to create habit. Please retry.');
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppConstants.pagePadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () => context.go(RouteNames.HOME),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    Text('New Habit', style: AppTextStyle.headingSmall),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Habit name', style: AppTextStyle.bodySmall),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _titleController,
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a habit name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Example: Morning Walk',
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text('Motivation', style: AppTextStyle.bodySmall),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _motivationController,
                        minLines: 2,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Why this habit matters to you',
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Target days per week',
                        style: AppTextStyle.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<int>(
                        initialValue: _targetDays,
                        items: List<DropdownMenuItem<int>>.generate(7, (
                          int index,
                        ) {
                          final int value = index + 1;
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value days'),
                          );
                        }),
                        onChanged: (int? value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _targetDays = value;
                          });
                        },
                      ),
                      const SizedBox(height: 14),
                      Text('Color', style: AppTextStyle.bodySmall),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: _palette.map((String hex) {
                          final bool isSelected = _selectedColorHex == hex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColorHex = hex;
                              });
                            },
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: _hexToColor(hex),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.lightOnBackground
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _isSaving ? null : _saveHabit,
                    icon: _isSaving
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save_outlined),
                    label: Text(_isSaving ? 'Saving...' : 'Save Habit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color _hexToColor(String hex) {
  final String sanitized = hex.replaceAll('#', '');
  final String normalized = sanitized.length == 6 ? 'FF$sanitized' : sanitized;
  return Color(int.parse(normalized, radix: 16));
}
