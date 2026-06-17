import 'package:expense_trackerapp/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _buildBalanceCard(),
                    const SizedBox(height: 14),
                    _buildSpendingAnalysis(),
                    const SizedBox(height: 14),
                    _buildBudgetGoal(),
                    const SizedBox(height: 14),
                    _buildRecentTransactions(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    //  floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: kBalanceYellow,child: Icon(Icons.add),),
    );
  }

  // ── App Bar ────────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          // Logo dot + name
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: kAccentPurple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.hexagon_outlined,
                color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          const Text(
            'EXPENSE TRACKER',
            style: TextStyle(
              color: kTextPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kDivider),
            ),
            child: const Icon(Icons.notifications_outlined,
                color: kTextSecondary, size: 20),
          ),
        ],
      ),
    );
  }

  // ── Balance Card ───────────────────────────────────────────────────────────
  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2540), Color(0xFF0F1829)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kDivider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TOTAL BALANCE',
            style: TextStyle(
              color: kTextSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '\$24,580.00',
            style: TextStyle(
              color: kTextPrimary,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Monthly spending
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.arrow_downward_rounded,
                          color: kTextSecondary, size: 14),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('MONTHLY\nSPENDING',
                            style: TextStyle(
                                color: kTextSecondary,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                height: 1.4)),
                        SizedBox(height: 2),
                        Text('\$4,215.50',
                            style: TextStyle(
                                color: kTextPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 36, color: kDivider),
              const SizedBox(width: 16),
              // Savings
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: kAccentGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.savings_outlined,
                          color: kAccentGreen, size: 14),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('SAVINGS',
                            style: TextStyle(
                                color: kTextSecondary,
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5)),
                        SizedBox(height: 2),
                        Text('\$1,850.25',
                            style: TextStyle(
                                color: kAccentGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Spending Analysis ──────────────────────────────────────────────────────
  Widget _buildSpendingAnalysis() {
    final items = [
      _SpendItem('Rent', '\$2,100', 50, kAccentYellow),
      _SpendItem('Food', '\$840', 20, kAccentPurple),
      _SpendItem('Transport', '\$420', 10, kAccentGreen),
    ];

    return _SectionCard(
      title: 'SPENDING ANALYSIS',
      child: Column(
        children: items
            .map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _spendingRow(item),
                ))
            .toList(),
      ),
    );
  }

  Widget _spendingRow(_SpendItem item) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(item.title,
                style: const TextStyle(
                    color: kTextPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            Text(
              '${item.amount} (${item.percent.toInt()}%)',
              style: const TextStyle(color: kTextSecondary, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: item.percent / 100,
            minHeight: 5,
            backgroundColor: kDivider,
            valueColor: AlwaysStoppedAnimation(item.color),
          ),
        ),
      ],
    );
  }

  // ── Budget Goal ────────────────────────────────────────────────────────────
  Widget _buildBudgetGoal() {
    return _SectionCard(
      title: 'BUDGET GOAL',
      child: Center(
        child: SizedBox(
          width: 140,
          height: 140,
          child: CustomPaint(
            painter: _RingPainter(progress: 0.75, color: kAccentYellow),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('75%',
                      style: TextStyle(
                          color: kTextPrimary,
                          fontSize: 26,
                          fontWeight: FontWeight.w800)),
                  Text('of Goal',
                      style:
                          TextStyle(color: kTextSecondary, fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Recent Transactions ────────────────────────────────────────────────────
  Widget _buildRecentTransactions() {
    final txns = [
      _Txn('Whole Foods Market', 'Groceries · Today, 10:45 AM',
          '-\$142.30', Icons.shopping_cart_outlined, kAccentPurple),
      _Txn('Uber Technologies', 'Transport · Yesterday',
          '-\$24.50', Icons.directions_car_outlined, kAccentBlue),
      _Txn('Rent Deposit', 'Rent · 2 days ago',
          '-\$2,100.00', Icons.home_outlined, kAccentYellow),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('RECENT TRANSACTIONS',
                style: TextStyle(
                    color: kTextSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5)),
            GestureDetector(
              onTap: () {},
              child: const Text('View All',
                  style: TextStyle(
                      color: kAccentPurple,
                      fontSize: 12,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kDivider),
          ),
          child: Column(
            children: txns.asMap().entries.map((e) {
              final isLast = e.key == txns.length - 1;
              return Column(
                children: [
                  _txnRow(e.value),
                  if (!isLast)
                    const Divider(
                        color: kDivider, height: 1, indent: 16, endIndent: 16),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _txnRow(_Txn txn) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: txn.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(txn.icon, color: txn.color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txn.title,
                    style: const TextStyle(
                        color: kTextPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(txn.subtitle,
                    style: const TextStyle(
                        color: kTextSecondary, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(txn.amount,
                  style: const TextStyle(
                      color: kTextPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: kAccentGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('COMPLETED',
                    style: TextStyle(
                        color: kAccentGreen,
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Section Card wrapper ─────────────────────────────────────────────────────
class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kDivider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: kTextSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5)),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

// ─── Ring Painter ─────────────────────────────────────────────────────────────
class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  const _RingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final trackPaint = Paint()
      ..color = kDivider
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}

// ─── Data models ──────────────────────────────────────────────────────────────
class _SpendItem {
  final String title, amount;
  final double percent;
  final Color color;
  const _SpendItem(this.title, this.amount, this.percent, this.color);
}

class _Txn {
  final String title, subtitle, amount;
  final IconData icon;
  final Color color;
  const _Txn(this.title, this.subtitle, this.amount, this.icon, this.color);
}
