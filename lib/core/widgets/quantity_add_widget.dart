import 'package:flutter/material.dart';
import 'package:gestapo/resources/resources.dart';
import 'package:gestapo/utils/utils.dart';

class QuantityAddWidget extends StatefulWidget {
  const QuantityAddWidget({
    Key? key,
    required this.getQuantity,
    required this.currentQuantity,
  }) : super(key: key);
  final void Function(int) getQuantity;
  final int currentQuantity;

  @override
  State<QuantityAddWidget> createState() => _QuantityAddWidgetState();
}

class _QuantityAddWidgetState extends State<QuantityAddWidget> {
  late int quantity = widget.currentQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.25,
      height: context.height * 0.048,
      decoration: BoxDecoration(
        color: AppColors.kSpecialGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: !(quantity <= 1),
            child: GestureDetector(
              onTap: () {
                if (quantity <= 1) return;
                setState(() {
                  quantity = quantity - 1;
                  widget.getQuantity(quantity);
                });
              },
              child: const Icon(
                Icons.remove,
                color: AppColors.kWhite,
              ),
            ),
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                quantity = quantity + 1;
                widget.getQuantity(quantity);
              });
            },
            child: const Icon(
              Icons.add,
              color: AppColors.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
