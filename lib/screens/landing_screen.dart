import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'login_screen.dart'; // Đảm bảo bạn đã có file login_screen.dart

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String selectedCertificate = 'TOEIC';

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
                'extra efficient',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Log in', style: TextStyle(color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1B3A82),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: const Text('CREATE ACCOUNT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HERO SECTION ---
              const Text(
                'Know where you stand.\nKnow what\'s next.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF111827),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Practice for an English certificate with a level-matched path, skill-based exercises, and progress that\'s your own.',
                style: TextStyle(fontSize: 14, color: Color(0xFF4B5563), height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text('START WITH', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF6B7280))),
              const SizedBox(height: 8),

              // Bộ lọc lựa chọn chứng chỉ
              Row(
                children: ['TOEIC', 'IELTS', 'VSTEP'].map((cert) {
                  bool isSelected = selectedCertificate == cert;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cert),
                      selected: isSelected,
                      selectedColor: Colors.black,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedCertificate = cert;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B3A82),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('START WITH $selectedCertificate', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- LEARNING PATH CARD ---
              Card(
                elevation: 4,
                color: const Color(0xFF1E232A),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('LEARNING PATH', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                          Text(
                            '$selectedCertificate • SAMPLE',
                            style: const TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white24, height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Step by step to your target.', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B3A82),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                const Text('TARGET', style: TextStyle(color: Colors.white70, fontSize: 9)),
                                Text(
                                  selectedCertificate == 'TOEIC' ? '750' : (selectedCertificate == 'IELTS' ? '6.5' : 'B2'),
                                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Progress this week', style: TextStyle(color: Colors.white70, fontSize: 12)),
                          Text('68%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(
                        value: 0.68,
                        backgroundColor: Colors.white12,
                        color: Colors.green,
                        minHeight: 6,
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4 / 6 sessions', style: TextStyle(color: Colors.white54, fontSize: 10)),
                          Text('Following a personalized path', style: TextStyle(color: Colors.white54, fontSize: 10)),
                        ],
                      ),
                      const Divider(color: Colors.white24, height: 24),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('NEXT STEP', style: TextStyle(color: Colors.white54, fontSize: 10)),
                              SizedBox(height: 4),
                              Text('Listening practice — Part 3\n12 questions • about 15 min', style: TextStyle(color: Colors.white, fontSize: 13)),
                            ],
                          ),
                          Icon(Icons.arrow_forward, color: Colors.blueAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // --- STUDY WITH DIRECTION SECTION ---
              const Text(
                'STUDY WITH DIRECTION.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
              ),
              const SizedBox(height: 16),
              _buildStepCard('01', 'Find your level', 'Take a free placement test to see your strengths and what to practice next.', 'FREE'),
              _buildStepCard('02', 'Get a matching path', 'Pick a target score. Your study plan is suggested based on your certificate and level.', 'PERSONALIZED'),
              _buildStepCard('03', 'Practice and improve', 'Practice each skill, see your weakness analysis, and adjust your next step.', 'TRACKED'),
              const SizedBox(height: 32),

              // --- THREE CERTIFICATES, ONE ACCOUNT SECTION ---
              const Text(
                'THREE CERTIFICATES,\nONE ACCOUNT',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF111827), height: 1.2),
              ),
              const SizedBox(height: 12),
              const Text(
                'Pick the certificate you are working toward. Your placement test, learning path, practice bank and mock exams all follow that certificate\'s real structure and scoring — and you can switch at any time.',
                style: TextStyle(fontSize: 13, color: Color(0xFF4B5563), height: 1.5),
              ),
              const SizedBox(height: 20),

              // --- HIỂN THỊ CHI TIẾT CHỨNG CHỈ ĐỘNG THEO LỰA CHỌN ---
              _buildSelectedCertificateDetail(),
              const SizedBox(height: 16),

              // --- BOTTOM BANNER ---
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
                    const Text(
                      'Not sure which one fits your goal?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF111827)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Create a free account and take the placement test — it works for every certificate.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B3A82),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupScreen()),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('START FOR FREE', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCertificateDetail() {
    String title = '';
    String description = '';
    List<String> details = [];

    if (selectedCertificate == 'TOEIC') {
      title = 'TOEIC — LISTENING & READING';
      description = 'The standard workplace English test. 200 multiple-choice questions, about 2 hours, scored 10–990. Practice speaking and writing separately with AI-graded tasks.';
      details = [
        'Listening — 45 minutes • 100 questions',
        '• Part 1 — Photographs (6)',
        '• Part 2 — Question-Response (25)',
        '• Part 3 — Conversations (39)',
        '• Part 4 — Talks (30)',
        'Reading — 75 minutes • 100 questions',
        '• Part 5 — Incomplete Sentences (30)',
        '• Part 6 — Text Completion (16)',
        '• Part 7 — Reading Comprehension (54)',
      ];
    } else if (selectedCertificate == 'IELTS') {
      title = 'IELTS — ACADEMIC & GENERAL';
      description = 'The four-skill test for study, migration and work abroad. Scored in 0.5 steps from 0.0 to 9.0, with a separate band for each skill.';
      details = [
        'Listening — about 30 minutes • 40 questions',
        'Reading — 60 minutes • 40 questions',
        'Writing — 60 minutes • 2 tasks',
        'Speaking — 11–14 minutes • 3 parts',
      ];
    } else {
      title = 'VSTEP — THE VIETNAMESE NATIONAL TEST';
      description = 'The national English proficiency test used by Vietnamese universities and employers. Four skills, reported on a 0–10 scale mapped to CEFR levels A2 to C1.';
      details = [
        'Listening — about 40 minutes',
        'Reading — 60 minutes',
        'Writing — 60 minutes',
        'Speaking — about 12 minutes',
      ];
    }

    return _buildCertificateCard(title, description, details, 'START WITH $selectedCertificate');
  }

  Widget _buildStepCard(String number, String title, String subtitle, String badge) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B3A82))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF111827))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(badge, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(String title, String description, List<String> details, String buttonText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF6B7280))),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(fontSize: 13, color: Color(0xFF374151), height: 1.4)),
                const SizedBox(height: 12),
                ...details.map((detail) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    detail,
                    style: TextStyle(
                      fontSize: 12,
                      color: detail.startsWith('•') ? Colors.grey.shade600 : Colors.black87,
                      fontWeight: detail.startsWith('•') ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                )),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F2F5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF1B3A82),
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(width: 6),
                    const Icon(Icons.arrow_forward, size: 14),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}