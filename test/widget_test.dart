import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toiec_practice/main.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('LandingScreen smoke test for Extra Efficient UI', (WidgetTester tester) async {
    // Mock SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Khởi tạo app
    await tester.pumpWidget(const MyApp());
    // Xử lý bộ đếm thời gian
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // 1. Kiểm tra Navbar
    expect(find.text('extra efficient'), findsAtLeastNWidgets(1));
    expect(find.text('Log In'), findsAtLeastNWidgets(1));
    expect(find.text('CREATE ACCOUNT'), findsOneWidget);

    // 2. Thẻ LEARNING PATH và các phần tử UI chính
    expect(find.text('LEARNING PATH'), findsOneWidget);
    expect(find.text('750'), findsOneWidget);
    expect(find.text('01  /  TOEIC'), findsOneWidget);
    expect(find.text('02  /  IELTS'), findsOneWidget);
    expect(find.text('03  /  VSTEP'), findsOneWidget);

    // 3. Khối định hướng và tính năng
    expect(find.text('STUDY WITH DIRECTION.'), findsOneWidget);
    expect(find.text('Find your level'), findsOneWidget);
    expect(find.text('Get a matching path'), findsOneWidget);
    expect(find.text('Practice and improve'), findsOneWidget);
    expect(find.text('Practice by skill'), findsOneWidget);
    expect(find.text('A clear target.\nProgress every day.'), findsOneWidget);
  });
}
