import 'package:flutter/material.dart';

void main() {
  runApp(const CameraGuardApp());
}

class CameraGuardApp extends StatelessWidget {
  const CameraGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera Guard',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315C75),
        ),
      ),
      home: const DetectionPage(),
    );
  }
}

class DetectionPage extends StatelessWidget {
  const DetectionPage({super.key});

  void showLargeImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 5,
                child: Image.asset(
                  'assets/images/result.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 520,
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상단 로고
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFF315C75),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.center_focus_strong,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CAMERA GUARD',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                              color: Color(0xFF17242D),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '안심 탐지 시스템',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF77838B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    '탐지 결과',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF17242D),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    '최근 촬영된 이미지를 확인할 수 있습니다.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7C878E),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 상태 카드
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF5EF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFCFE7D8),
                      ),
                    ),
                    child: const Row(
                      children: [
                        ContainerStatusIcon(),
                        SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '촬영 완료',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF286541),
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                '이미지가 정상적으로 전송되었습니다.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF65806E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // 이미지 카드
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.asset(
                          'assets/images/result.jpg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // 크게 보기 버튼
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: () => showLargeImage(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF315C75),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      icon: const Icon(Icons.open_in_full, size: 19),
                      label: const Text(
                        '이미지 크게 보기',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    '촬영 정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF17242D),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 정보 카드
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFE8ECEF),
                      ),
                    ),
                    child: const Column(
                      children: [
                        InfoRow(
                          icon: Icons.location_on_outlined,
                          title: '촬영 위치',
                          value: '화장실 2번 칸',
                        ),
                        Divider(height: 1),
                        InfoRow(
                          icon: Icons.schedule_outlined,
                          title: '촬영 시각',
                          value: '14:32:17',
                        ),
                        Divider(height: 1),
                        InfoRow(
                          icon: Icons.wifi_tethering,
                          title: '기기 상태',
                          value: '정상 연결',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  Center(
                    child: Text(
                      'Camera Guard · Safety Detection System',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerStatusIcon extends StatelessWidget {
  const ContainerStatusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Color(0xFFD4ECDD),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_rounded,
        color: Color(0xFF287047),
        size: 25,
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(
            icon,
            size: 21,
            color: const Color(0xFF71808A),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF77838B),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF26343C),
            ),
          ),
        ],
      ),
    );
  }
}