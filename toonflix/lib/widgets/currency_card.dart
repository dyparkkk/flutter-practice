import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  final _blackColor = Colors.blueGrey.shade800;

  CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  // TODO : 통화이름, 총액, 단위, icon
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 32,
                    color: isInverted ? _blackColor : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 18,
                        color: isInverted
                            ? _blackColor
                            : Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      code,
                      style: TextStyle(
                        fontSize: 15,
                        color: isInverted
                            ? _blackColor
                            : Colors.white.withOpacity(0.7),
                      ),
                    )
                  ],
                )
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(-5, 8),
                child: Icon(
                  icon,
                  color: isInverted ? _blackColor : Colors.white,
                  size: 98,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
