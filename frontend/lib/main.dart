import 'package:flutter/material.dart';

void main() {
  runApp(const FitFlowApp());
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
      ),
      home: const RootNavigation(),
    );
  }
}

class RootNavigation extends StatefulWidget {
  const RootNavigation({super.key});

  @override
  State<RootNavigation> createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    WorkoutsScreen(),
    NutritionScreen(),
    SocialScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.fitness_center_outlined), selectedIcon: Icon(Icons.fitness_center), label: 'Workouts'),
          NavigationDestination(icon: Icon(Icons.restaurant_outlined), selectedIcon: Icon(Icons.restaurant), label: 'Nutrition'),
          NavigationDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label: 'Social'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ---------------- HOME ----------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Good morning, Alex 👋', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text('Here is your fitness snapshot for today', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(child: _StatCard(icon: Icons.local_fire_department, label: 'Calories', value: '540 kcal')),
            SizedBox(width: 12),
            Expanded(child: _StatCard(icon: Icons.directions_walk, label: 'Steps', value: '6,240')),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(child: _StatCard(icon: Icons.timer, label: 'Active time', value: '38 min')),
            SizedBox(width: 12),
            Expanded(child: _StatCard(icon: Icons.emoji_events, label: 'Streak', value: '5 days')),
          ],
        ),
        const SizedBox(height: 24),
        Text('Today\'s AI-personalized plan', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.auto_awesome, color: Color(0xFF2E7D32)),
            title: const Text('Upper Body Strength'),
            subtitle: const Text('35 min • Recommended based on your recent activity'),
            trailing: FilledButton(
              onPressed: () {},
              child: const Text('Start'),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF2E7D32)),
            const SizedBox(height: 8),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

// ---------------- WORKOUTS ----------------

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  static const List<Map<String, String>> _plans = [
    {'title': 'Full Body HIIT', 'duration': '25 min', 'level': 'Intermediate'},
    {'title': 'Lower Body Strength', 'duration': '40 min', 'level': 'Advanced'},
    {'title': 'Yoga & Mobility', 'duration': '20 min', 'level': 'Beginner'},
    {'title': 'Core & Abs Circuit', 'duration': '15 min', 'level': 'Beginner'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('AI Workout Plans', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text('Personalized for your goals and history', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 16),
        for (final plan in _plans)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.fitness_center)),
              title: Text(plan['title']!),
              subtitle: Text('${plan['duration']} • ${plan['level']}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
      ],
    );
  }
}

// ---------------- NUTRITION ----------------

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Nutrition Tracking', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today\'s Macros', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                _MacroBar(label: 'Protein', value: 0.7, detail: '105g / 150g'),
                const SizedBox(height: 8),
                _MacroBar(label: 'Carbs', value: 0.55, detail: '180g / 320g'),
                const SizedBox(height: 8),
                _MacroBar(label: 'Fats', value: 0.4, detail: '40g / 100g'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text('Logged Meals', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(child: ListTile(leading: const Icon(Icons.egg_outlined), title: const Text('Breakfast'), subtitle: const Text('Oats, banana, peanut butter · 420 kcal'))),
        Card(child: ListTile(leading: const Icon(Icons.lunch_dining_outlined), title: const Text('Lunch'), subtitle: const Text('Grilled chicken salad · 510 kcal'))),
        const SizedBox(height: 8),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Log a meal')),
      ],
    );
  }
}

class _MacroBar extends StatelessWidget {
  final String label;
  final double value;
  final String detail;

  const _MacroBar({required this.label, required this.value, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Text(detail, style: Theme.of(context).textTheme.bodySmall)],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(value: value, minHeight: 8),
        ),
      ],
    );
  }
}

// ---------------- SOCIAL ----------------

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  static const List<Map<String, String>> _posts = [
    {'name': 'Priya S.', 'text': 'Just finished a 10K run! Feeling great 🏃‍♀️', 'likes': '24'},
    {'name': 'Daniel K.', 'text': 'New personal best on deadlifts today 💪', 'likes': '18'},
    {'name': 'Mei L.', 'text': 'Morning yoga session done. Namaste 🧘', 'likes': '31'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Community Feed', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        for (final post in _posts)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(child: Icon(Icons.person)),
                      const SizedBox(width: 8),
                      Text(post['name']!, style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(post['text']!),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.favorite_border, size: 18),
                      const SizedBox(width: 4),
                      Text('${post['likes']} likes'),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// ---------------- PROFILE ----------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(height: 12),
        Center(child: Text('Alex Johnson', style: Theme.of(context).textTheme.titleLarge)),
        Center(child: Text('Member since 2026', style: Theme.of(context).textTheme.bodySmall)),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(leading: const Icon(Icons.favorite_border), title: const Text('Health data & permissions'), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.privacy_tip_outlined), title: const Text('Privacy policy'), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('Settings'), onTap: () {}),
              const Divider(height: 1),
              ListTile(leading: const Icon(Icons.logout), title: const Text('Log out'), onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}