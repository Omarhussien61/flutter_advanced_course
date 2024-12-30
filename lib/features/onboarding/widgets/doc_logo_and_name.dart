import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/styles.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/svgs/docdoc_logo.svg',
        height: ScreenUtil.defaultSize.width/3,
        width: ScreenUtil.defaultSize.width/3,
      ),
    );
  }
}
