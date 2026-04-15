import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> services = const [
    {
      'id': '01',
      'title': 'Game Development',
      'description':
          'Indie games, VR experiences, PC and mobile titles that push creative boundaries.',
      'items': ['Indie Games', 'VR Experiences', 'PC Gaming', 'Mobile Apps'],
    },
    {
      'id': '02',
      'title': 'Software Engineering',
      'description':
          'Custom scripts, automation tools, and web applications built with precision.',
      'items': ['Open Source', 'Custom Scripts', 'Automation', 'Web Apps'],
    },
    {
      'id': '03',
      'title': 'Hardware Design',
      'description':
          'PCB design, circuit engineering, and embedded systems for innovative devices.',
      'items': ['PCB Design', 'Circuits', 'Embedded Systems', 'Prototyping'],
    },
    {
      'id': '04',
      'title': 'CAD & Engineering',
      'description':
          '3D modeling, product design, and technical engineering for physical products.',
      'items': [
        '3D Modeling',
        'Product Design',
        'Technical Drawings',
        'Devices'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
      constraints:
          BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '// services.init()',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'What we do',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: MediaQuery.of(context).size.width < 768 ? 1 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
            childAspectRatio: 1.22,
            physics: NeverScrollableScrollPhysics(),
            children: services.map((service) {
              return Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['id'],
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      service['title'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      service['description'],
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: (service['items'] as List<String>).map((item) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            item,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
