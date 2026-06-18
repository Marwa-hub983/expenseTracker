
import 'package:expense_trackerapp/shared/constants/colors.dart';
import 'package:expense_trackerapp/shared/themes/font_palette.dart';
import 'package:expense_trackerapp/shared/utils/responsive/responsive.dart';

import 'package:flutter/material.dart';



class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
    this.title,
    this.logo = false,
    this.centerTitle = true,
    this.actions = const [],
    this.color = const Color(0xFF020C24),
    this.iconColor,
    this.actionTitle,
    this.titleColor,
    this.shadow = false,
    this.hideLeading = false,
    this.prefixbackbutton = false,
    this.height = kToolbarHeight,
    this.style,
    this.onLeadingPressed,
    this.leadingIcon,
    this.titleWidget,
    this.automaticallyImplyLeading = true,
  });

  final String? title, actionTitle;
  final bool logo, shadow, centerTitle, prefixbackbutton;
  final List<Widget> actions;
  final Color? color, iconColor, titleColor;
  final bool hideLeading, automaticallyImplyLeading;
  final double height;
  final TextStyle? style;
  final VoidCallback? onLeadingPressed;
  final Widget? leadingIcon, titleWidget;

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);

    return AppBar(
      toolbarHeight: Responsive.h(context, height),
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: iconColor ?? kWhite,
        size: Responsive.w(context, 20),
      ),
      backgroundColor: color,
      elevation: shadow ? 1.0 : 0,
      shadowColor: shadow ? kBlack.withOpacity(0.1) : null,
      leadingWidth: logo ? Responsive.w(context, 22) : null,
      automaticallyImplyLeading:
          hideLeading ? false : automaticallyImplyLeading,
      shape: shadow
          ? Border(
              bottom: BorderSide(
                color: kBlack.withOpacity(0.1),
                width: 0.5,
              ),
            )
          : null,
      leading: _buildLeading(context, canPop),
      titleSpacing: canPop ? 0 : null,
      title: _buildTitle(context),
      centerTitle: centerTitle,
      actions: _buildActions(context),
    );
  }

  Widget? _buildLeading(BuildContext context, bool canPop) {
    if (hideLeading) return null;
    if (!automaticallyImplyLeading && !canPop) return null;

    return leadingIcon ??
        IconButton(
          onPressed: onLeadingPressed ?? () => Navigator.maybePop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: iconColor ?? kWhite,
            size: Responsive.w(context, 20),
          ),
          tooltip: 'Back',
        );
  }

  Widget? _buildTitle(BuildContext context) {
    if (titleWidget != null) return titleWidget;

    if (title != null) {
      return Text(
        title!,
        style: (style ?? FontPalette.hW700S14).copyWith(
          color: titleColor,
          fontSize: Responsive.w(context, 14),
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      );
    }

    return null;
  }

  List<Widget> _buildActions(BuildContext context) {
    if (actionTitle != null) {
      return [
        TextButton(
          onPressed: () {},
          child: Text(
            actionTitle!,
            style: FontPalette.hW700S14.copyWith(
              color: iconColor ?? kBlack,
              fontSize: Responsive.w(context, 14),
            ),
          ),
        ),
        SizedBox(width: Responsive.w(context, 8)),
      ];
    }

    return actions;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}