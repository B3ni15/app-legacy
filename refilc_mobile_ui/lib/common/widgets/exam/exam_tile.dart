import 'package:refilc/helpers/subject.dart';
import 'package:refilc/theme/colors/colors.dart';
import 'package:refilc_kreta_api/models/exam.dart';
import 'package:refilc_mobile_ui/common/round_border_icon.dart';
import 'package:flutter/material.dart';
import 'package:refilc/utils/format.dart';

class ExamTile extends StatelessWidget {
  const ExamTile(this.exam,
      {super.key, this.onTap, this.padding, this.showSubject = true});

  final Exam exam;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final bool showSubject;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          visualDensity: VisualDensity.compact,
          contentPadding: const EdgeInsets.only(left: 8.0, right: 10.0),
          onTap: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
          leading: RoundBorderIcon(
            icon: Icon(
              Icons.edit_document,
              size: showSubject ? 24.0 : 22.0,
              weight: 2.5,
            ),
            padding: showSubject ? 6.0 : 5.0,
            width: 1.0,
          ),
          title: Text(
            showSubject
                ? exam.mode?.description ?? 'Számonkérés'
                : (exam.description != ""
                    ? exam.description
                    : (exam.mode?.description ?? "Számonkérés")),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            showSubject
                ? (exam.subject.isRenamed
                    ? exam.subject.renamedTo!
                    : exam.subject.name.capital())
                : exam.mode?.description ?? 'Számonkérés',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          trailing: showSubject
              ? Icon(
                  SubjectIcon.resolveVariant(
                      context: context, subject: exam.subject),
                  color: AppColors.of(context).text.withValues(alpha: .5),
                )
              : null,
          minLeadingWidth: 0,
        ),
      ),
    );
  }
}
