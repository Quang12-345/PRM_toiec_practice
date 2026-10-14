import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _agreedToTerms = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B3A82),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'ee',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            const Text('extra efficient', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề SIGN UP
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF1F242C),
                border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 3)),
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 1.2),
              ),
            ),
            const SizedBox(height: 20),

            // Form Đăng ký
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField('FULL NAME', _fullNameController),
                  const SizedBox(height: 16),
                  _buildTextField('EMAIL', _emailController, keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _buildTextField('PHONE NUMBER (OPTIONAL)', _phoneController, keyboardType: TextInputType.phone),
                  const SizedBox(height: 16),
                  _buildPasswordField('PASSWORD', _passwordController, _obscurePassword, () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  }),
                  const SizedBox(height: 4),
                  const Text(
                    'At least 8 characters, with letters and numbers.',
                    style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                  ),
                  const SizedBox(height: 16),
                  _buildPasswordField('CONFIRM PASSWORD', _confirmPasswordController, _obscureConfirmPassword, () {
                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                  }),
                  const SizedBox(height: 16),

                  // Checkbox Terms of use
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _agreedToTerms,
                          onChanged: (val) => setState(() => _agreedToTerms = val ?? false),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('I agree to the terms of use', style: TextStyle(fontSize: 13, color: Color(0xFF374151))),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Nút CREATE ACCOUNT
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B3A82),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, color: Colors.white, size: 18),
                    SizedBox(width: 8),
                    Text('CREATE ACCOUNT', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Chuyển hướng sang Sign in
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TextStyle(color: Color(0xFF6B7280), fontSize: 13)),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Color(0xFF1B3A82), fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- WHAT YOU GET ON DAY ONE CARD ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: const Text(
                      'WHAT YOU GET ON DAY ONE',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBenefitItem('1.', 'Take the placement test.', ' It is free and sets your starting level.'),
                        const SizedBox(height: 8),
                        _buildBenefitItem('2.', 'Get a learning path.', ' Modules run from your level to your target.'),
                        const SizedBox(height: 8),
                        _buildBenefitItem('3.', 'Practise as much as you like.', ' Listening and reading practice never costs a credit.'),
                        const SizedBox(height: 16),

                        // Bảng Cost Credits
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E232A),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.white24)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('COSTS CREDITS', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                    Text('COST', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              _buildCreditRow('START A MOCK EXAM', '1 credit'),
                              _buildCreditRow('AI GRADING OF SPEAKING OR WRITING', '1 credit'),
                              _buildCreditRow('BOOK A MENTOR SESSION', '1 credit'),
                              _buildCreditRow('PREMIUM LEARNING PATH', '5 credits', isLast: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Credits do not expire once bought.',
                          style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF374151))),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Color(0xFF1B3A82), width: 2)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, bool obscureText, VoidCallback onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF374151))),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            suffixIcon: IconButton(
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, size: 18, color: Colors.grey),
              onPressed: onToggle,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey.shade400)),
            focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)), borderSide: BorderSide(color: Color(0xFF1B3A82), width: 2)),
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitItem(String number, String boldText, String normalText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF111827))),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 12, color: Color(0xFF374151), height: 1.4),
              children: [
                TextSpan(text: boldText, style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: normalText),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreditRow(String title, String cost, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: Colors.white12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500))),
          Text(cost, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}