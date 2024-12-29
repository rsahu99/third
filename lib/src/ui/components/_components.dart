export 'list_viewbuilder_1.dart';

import 'package:flutter/material.dart';

abstract class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key});
  
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}