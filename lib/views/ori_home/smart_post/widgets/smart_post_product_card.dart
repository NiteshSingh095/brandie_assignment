import 'package:brandie/models/smart_post/smart_post.dart';
import 'package:brandie/res/res.dart';
import 'package:flutter/material.dart';

class SmartPostProductCard extends StatefulWidget {
  const SmartPostProductCard({
    super.key,
    required this.product,
    required this.isActive,
    required this.onTap,
  });

  final ProductInfoModel product;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<SmartPostProductCard> createState() => _SmartPostProductCardState();
}

class _SmartPostProductCardState extends State<SmartPostProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.isActive) {
      _scheduleShow();
    }
  }

  @override
  void didUpdateWidget(covariant SmartPostProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _controller.reset();
      _scheduleShow();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.reset();
    }
  }

  Future<void> _scheduleShow() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted || !widget.isActive) return;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final hasTrending = product.trendingText != null && product.trendingText!.isNotEmpty;

    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: Dimens.edgeInsetsSymmetric(horizontal: Dimens.sixteen),
            padding: Dimens.edgeInsetsAll(Dimens.twelve),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(Dimens.twelve),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.eight),
                  child: Image.asset(
                    product.thumbnail,
                    width: Dimens.fortyEight,
                    height: Dimens.fortyEight,
                    fit: BoxFit.cover,
                    errorBuilder: (_, error, stackTrace) => Container(
                      width: Dimens.fortyEight,
                      height: Dimens.fortyEight,
                      color: Colors.white24,
                    ),
                  ),
                ),
                Dimens.boxWidth(Dimens.twelve),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimens.fourteen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Dimens.boxHeight(Dimens.four),
                      if (hasTrending)
                        Text(
                          product.trendingText!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimens.twelve,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      else
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (product.price != null)
                              Text(
                                product.price!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimens.thirteen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            if (product.discountLabel != null) ...[
                              Dimens.boxWidth(Dimens.eight),
                              Container(
                                padding: Dimens.edgeInsetsSymmetric(
                                  horizontal: Dimens.eight,
                                  vertical: Dimens.two,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(Dimens.eight),
                                ),
                                child: Text(
                                  product.discountLabel!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimens.twelve,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
