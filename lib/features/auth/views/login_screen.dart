import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart';
import 'otp_screen.dart';
import '../../../core/utils/snackbar_utils.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleGetOtp() {
    if (_formKey.currentState!.validate()) {
      ref.read(authProvider.notifier).sendOtp(_phoneController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        otpSent: (phone) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OtpScreen(phone: phone)),
          );
        },
        error: (message) {
          SnackbarUtils.show(context, message);
        },
        orElse: () {},
      );
    });

    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const SizedBox(height: 48),
                // Title
                Text('Welcome', style: AppTextStyles.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  'Enter your phone number to continue',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),
                // Phone Input Label
                Text('Phone Number', style: AppTextStyles.labelMedium),
                const SizedBox(height: 8),
                // Phone Input Field
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.borderFigma,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Country Code
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text('🇮🇳', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 8),
                            Text(
                              '+91',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider
                      Container(
                        width: 1,
                        height: 24,
                        color: AppColors.borderFigma,
                      ),
                      // Phone Input
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter phone number',
                            hintStyle: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPlaceholder,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter phone number';
                            }
                            if (value.length != 10) {
                              return 'Please enter valid 10 digit number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Get OTP Button
                PrimaryButton(
                  text: 'Get OTP',
                  onPressed: _handleGetOtp,
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                // Terms Text
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textTertiary,
                      ),
                      children: [
                        const TextSpan(
                          text: 'By continuing, you agree to our ',
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
