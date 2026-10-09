
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8064A8),
        ),
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;
    final layarLebar = lebarLayar > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FB),
      appBar: AppBar(
        title: const Text(
          'Kartu Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF382B4A),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8F6FB),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Card(
              color: Colors.white,
              elevation: 3,
              shadowColor: const Color(0x228064A8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: EdgeInsets.all(layarLebar ? 28 : 18),
                child: layarLebar
                    ? const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160,
                            child: FotoProfil(),
                          ),
                          SizedBox(width: 28),
                          Expanded(
                            child: InformasiProfil(
                              layarLebar: true,
                            ),
                          ),
                        ],
                      )
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FotoProfil(),
                          SizedBox(height: 24),
                          Divider(
                            color: Color(0xFFF0EBF6),
                          ),
                          SizedBox(height: 18),
                          InformasiProfil(
                            layarLebar: false,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// FOTO PROFIL DAN BADGE ONLINE
class FotoProfil extends StatelessWidget {
  const FotoProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF0EBF6),
            ),
            child: const CircleAvatar(
              radius: 65,
              backgroundColor: Color(0xFFF8F6FB),
              backgroundImage: AssetImage(
                'assets/foto_profil.jpeg',
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            right: -5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F3EC),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Text(
                'Online',
                style: TextStyle(
                  color: Color(0xFF477C60),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// INFORMASI PROFIL
class InformasiProfil extends StatelessWidget {
  final bool layarLebar;

  const InformasiProfil({
    super.key,
    required this.layarLebar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama
        Text(
          'Lailatul Nur Aifa Rahmawati',
          textAlign:
              layarLebar ? TextAlign.left : TextAlign.center,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382B4A),
          ),
        ),
        const SizedBox(height: 6),

        // Jabatan atau program studi
        Text(
          'Mahasiswa Sistem Informasi',
          textAlign:
              layarLebar ? TextAlign.left : TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF8064A8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),

        // Deskripsi singkat
        const Text(
          'Saya adalah mahasiswa Sistem Informasi yang senang '
          'mempelajari teknologi dan mengembangkan ide menjadi '
          'solusi yang bermanfaat. Saya terus belajar untuk '
          'menambah pengetahuan, meningkatkan keterampilan, '
          'dan menciptakan hal-hal baru.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF766D80),
          ),
        ),
        const SizedBox(height: 22),

        // KEAHLIAN
        const Text(
          'Keahlian',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382B4A),
          ),
        ),
        const SizedBox(height: 10),

        const Wrap(
          alignment: WrapAlignment.start,
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              avatar: Icon(
                Icons.design_services_outlined,
                size: 16,
                color: Color(0xFF8064A8),
              ),
              label: Text('UI/UX Design'),
              backgroundColor: Color(0xFFF0EBF6),
              side: BorderSide.none,
            ),
            Chip(
              avatar: Icon(
                Icons.storage_outlined,
                size: 16,
                color: Color(0xFF8064A8),
              ),
              label: Text('Database'),
              backgroundColor: Color(0xFFF0EBF6),
              side: BorderSide.none,
            ),
            Chip(
              avatar: Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: Color(0xFF8064A8),
              ),
              label: Text('Problem Solving'),
              backgroundColor: Color(0xFFF0EBF6),
              side: BorderSide.none,
            ),
          ],
        ),
        const SizedBox(height: 22),

        // KONTAK
        const Text(
          'Kontak',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF382B4A),
          ),
        ),
        const SizedBox(height: 12),

        // Row jika cukup, Wrap jika ruang terlalu sempit
        LayoutBuilder(
          builder: (context, constraints) {
            const kontak = [
              ItemKontak(
                ikon: Icons.email_outlined,
                label: 'Email',
              ),
              ItemKontak(
                ikon: Icons.phone_outlined,
                label: 'Telepon',
              ),
              ItemKontak(
                ikon: Icons.camera_alt_outlined,
                label: 'Instagram',
              ),
            ];

            if (constraints.maxWidth >= 240) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < kontak.length; i++) ...[
                    if (i > 0) const SizedBox(width: 16),
                    kontak[i],
                  ],
                ],
              );
            }

            return const Wrap(
              spacing: 16,
              runSpacing: 12,
              children: kontak,
            );
          },
        ),
      ],
    );
  }
}

// ITEM IKON KONTAK
class ItemKontak extends StatelessWidget {
  final IconData ikon;
  final String label;

  const ItemKontak({
    super.key,
    required this.ikon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFF0EBF6),
            child: Icon(
              ikon,
              color: const Color(0xFF8064A8),
              size: 22,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF766D80),
            ),
          ),
        ],
      ),
    );
  }
}