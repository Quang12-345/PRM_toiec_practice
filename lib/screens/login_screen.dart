import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Để điều hướng sang trang Sign Up khi bấm Sign up

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _keepMeSignedIn = false;
  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B3A82),
        elevation: 0,
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
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'EXTRA EFFICIENT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded, color: Colors.white, size: 16),
            label: const Text(
              'PROTOTYPE CATALOG',
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER TITLE: SIGN IN ---
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF1F242C),
                border: Border(
                  bottom: BorderSide(color: Color(0xFFFFD700), width: 3),
                ),
              ),
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- SIGN IN FORM CARD ---
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Email Field
                        const Text(
                          'EMAIL',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF374151)),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'ban@example.com',
                            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Color(0xFF1B3A82), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        const Text(
                          'PASSWORD',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF374151)),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                size: 18,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() => _obscurePassword = !_obscurePassword);
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(color: Color(0xFF1B3A82), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Forgot password link
                        GestureDetector(
                          onTap: () {
                            // Xử lý quên mật khẩu
                          },
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Color(0xFF1B3A82),
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Keep me signed in Checkbox
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: _keepMeSignedIn,
                                onChanged: (val) => setState(() => _keepMeSignedIn = val ?? false),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Keep me signed in',
                              style: TextStyle(fontSize: 13, color: Color(0xFF374151)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Bottom Action Area
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F2F5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      border: Border(top: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1B3A82),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            onPressed: () {
                              // Logic Đăng nhập
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SIGN IN',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('No account yet? ', style: TextStyle(color: Color(0xFF6B7280), fontSize: 13)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color(0xFF1B3A82),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- WHAT IS FREE AND WHAT COSTS CREDITS CARD ---
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: const Text(
                      'WHAT IS FREE AND WHAT COSTS CREDITS',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Bảng Credit details
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
                                    Text('ACTION', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                    Text('COST', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              _buildCreditRow('PLACEMENT TEST', 'FREE', isFree: true),
                              _buildCreditRow('PRACTICE, LISTENING AND READING', 'FREE', isFree: true),
                              _buildCreditRow('WEAKNESS ANALYSIS', 'FREE', isFree: true),
                              _buildCreditRow('START A MOCK EXAM', '1 credit'),
                              _buildCreditRow('AI GRADING OF SPEAKING OR WRITING', '1 credit'),
                              _buildCreditRow('BOOK A MENTOR SESSION', '1 credit'),
                              _buildCreditRow('PREMIUM LEARNING PATH', '5 credits', isLast: true),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Credits do not expire. Start with the free tools and buy credits only when you want a mock exam or a graded answer.',
                          style: TextStyle(fontSize: 11, color: Color(0xFF6B7280), height: 1.4),
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

  Widget _buildCreditRow(String action, String cost, {bool isFree = false, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: Colors.white12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              action,
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
          if (isFree)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                cost,
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            )
          else
            Text(
              cost,
              style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}