import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:easy_stepper/easy_stepper.dart';

class DigitStepper extends StatelessWidget {
  final int activeStep;
  final List<StepsModel> steps;
  final int maxStepReached;
  final double lineLength;
  final double lineSpace;
  final void Function(int)? onStepReached;
  final LineType lineType;
  final bool enableStepTapping;
  final Axis direction;
  final Color? unreachedStepBackgroundColor;
  final Color? unreachedStepTextColor;
  final Color? unreachedStepIconColor;
  final Color? unreachedStepBorderColor;
  final Color? activeStepTextColor;
  final Color? activeStepIconColor;
  final Color? activeStepBackgroundColor;
  final Color? activeStepBorderColor;
  final Color? finishedStepTextColor;
  final Color? finishedStepBackgroundColor;
  final Color? finishedStepBorderColor;
  final Color? finishedStepIconColor;
  final Color? defaultLineColor;
  final Color? unreachedLineColor;
  final Color? activeLineColor;
  final Color? finishedLineColor;
  final double stepRadius;
  final bool steppingEnabled;
  final bool disableScroll;
  final bool showTitle;
  final AlignmentGeometry alignment;
  final double? lineDotRadius;
  final double lineThickness;
  final EdgeInsetsDirectional padding;
  final double internalPadding;
  final Curve? stepReachedAnimationEffect;
  final Curve? stepAnimationCurve;
  final Duration stepReachedAnimationDuration;
  final Duration? stepAnimationDuration;
  final double borderThickness;
  final String? loadingAnimation;
  final StepShape stepShape;
  final double? stepBorderRadius;
  final BorderType defaultStepBorderType;
  final BorderType? unreachedStepBorderType;
  final BorderType? activeStepBorderType;
  final BorderType? finishedStepBorderType;
  final List<double> dashPattern;
  final bool showStepBorder;
  final bool showLoadingAnimation;
  final TextDirection textDirection;
  const DigitStepper({
    super.key,
    required this.activeStep,
    required this.steps,
    required this.maxStepReached,
    this.lineLength = 40,
    this.lineSpace = 0,
    this.lineType = LineType.normal,
    this.onStepReached,
    this.enableStepTapping = true,
    this.direction = Axis.horizontal,
    this.unreachedStepBackgroundColor,
    this.unreachedStepTextColor,
    this.unreachedStepIconColor,
    this.unreachedStepBorderColor,
    this.activeStepTextColor,
    this.activeStepIconColor,
    this.activeStepBackgroundColor,
    this.activeStepBorderColor,
    this.finishedStepTextColor,
    this.finishedStepBackgroundColor,
    this.finishedStepBorderColor,
    this.finishedStepIconColor,
    this.defaultLineColor,
    this.unreachedLineColor,
    this.activeLineColor,
    this.finishedLineColor,
    this.stepRadius = 12,
    this.steppingEnabled = true,
    this.disableScroll = true,
    this.showTitle = true,
    this.alignment = Alignment.center,
    this.lineDotRadius,
    this.lineThickness = 1,
    this.padding =
        const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
    this.internalPadding = 0,
    this.stepReachedAnimationEffect,
    this.stepAnimationCurve,
    this.stepReachedAnimationDuration = const Duration(milliseconds: 10),
    this.stepAnimationDuration,
    this.borderThickness = 0.8,
    this.loadingAnimation,
    this.stepShape = StepShape.circle,
    this.stepBorderRadius,
    this.defaultStepBorderType = BorderType.normal,
    this.unreachedStepBorderType,
    this.activeStepBorderType,
    this.finishedStepBorderType,
    this.dashPattern = const [3, 1],
    this.showStepBorder = false,
    this.showLoadingAnimation = false,
    this.textDirection = TextDirection.ltr,
  });

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
        activeStep: activeStep,
        lineLength: lineLength,
        lineSpace: lineSpace,
        lineType: lineType,
        maxReachedStep: maxStepReached,
        defaultLineColor: defaultLineColor ?? const DigitColors().cloudGray,
        activeStepBackgroundColor:
            activeStepBackgroundColor ?? const DigitColors().burningOrange,
        activeStepBorderColor: activeStepBorderColor,
        activeStepTextColor:
            activeStepTextColor ?? DigitTheme.instance.colorScheme.onSurface,
        activeLineColor: activeLineColor,
        activeStepBorderType: activeStepBorderType ?? defaultStepBorderType,
        activeStepIconColor: activeStepIconColor,
        alignment: alignment,
        unreachedLineColor: unreachedLineColor ?? const DigitColors().cloudGray,
        unreachedStepBorderColor:
            unreachedStepBorderColor ?? const DigitColors().cloudGray,
        unreachedStepBorderType:
            unreachedStepBorderType ?? defaultStepBorderType,
        unreachedStepIconColor:
            unreachedStepIconColor ?? const DigitColors().cloudGray,
        unreachedStepBackgroundColor:
            unreachedStepBackgroundColor ?? const DigitColors().cloudGray,
        unreachedStepTextColor:
            unreachedStepTextColor ?? DigitTheme.instance.colorScheme.onSurface,
        finishedLineColor: finishedLineColor ?? const DigitColors().cloudGray,
        finishedStepBackgroundColor:
            finishedStepBackgroundColor ?? const DigitColors().burningOrange,
        finishedStepTextColor:
            finishedStepTextColor ?? DigitTheme.instance.colorScheme.onSurface,
        finishedStepBorderColor:
            finishedStepBorderColor ?? const DigitColors().burningOrange,
        finishedStepBorderType: finishedStepBorderType ?? defaultStepBorderType,
        finishedStepIconColor:
            finishedStepIconColor ?? const DigitColors().burningOrange,
        internalPadding: internalPadding,
        showLoadingAnimation: showLoadingAnimation,
        stepRadius: stepRadius,
        showStepBorder: showStepBorder,
        lineThickness: lineThickness,
        onStepReached: onStepReached,
        disableScroll: disableScroll,
        enableStepTapping: enableStepTapping,
        borderThickness: borderThickness,
        direction: direction,
        dashPattern: dashPattern,
        defaultStepBorderType: defaultStepBorderType,
        loadingAnimation: loadingAnimation,
        padding: padding,
        showTitle: showTitle,
        stepAnimationCurve: stepAnimationCurve ?? stepReachedAnimationEffect,
        stepAnimationDuration:
            stepAnimationDuration ?? stepReachedAnimationDuration,
        stepBorderRadius: stepBorderRadius,
        steppingEnabled: steppingEnabled,
        stepShape: stepShape,
        textDirection: textDirection,
        steps: List.generate(
            steps.length,
            (index) => EasyStep(
                  customTitle: Container(
                    margin:
                        steps[index].titleMargin ?? const EdgeInsets.all(0.0),
                    padding:
                        steps[index].titlePadding ?? const EdgeInsets.all(0.0),
                    width: steps[index].titleWidth ?? 5,
                    child: Text(
                      steps[index].title,
                      style: DigitTheme.instance.mobileTheme.textTheme.bodySmall
                          ?.apply(
                              color: DigitTheme.instance.colorScheme.onSurface),
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
                  ),
                  enabled: onStepReached != null && index < activeStep,
                  customStep: Container(
                    height: stepRadius * 2,
                    width: stepRadius * 2,
                    padding: steps[index].padding,
                    decoration: BoxDecoration(
                      color: index <= activeStep
                          ? activeStepBackgroundColor ??
                              const DigitColors().burningOrange
                          : unreachedStepBackgroundColor ??
                              const DigitColors().cloudGray,
                      shape: steps[index].shape,
                    ),
                    child: Center(
                      child: index >= activeStep
                          ? FittedBox(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                steps[index].number,
                                style: DigitTheme
                                    .instance.mobileTheme.textTheme.bodySmall
                                    ?.apply(color: const DigitColors().white),
                              ))
                          : Icon(
                              steps[index].completedIcon ?? Icons.check,
                              color: steps[index].iconColor ??
                                  const DigitColors().white,
                              size: stepRadius,
                            ),
                    ),
                  ),
                )));
  }
}

class StepsModel {
  final String title;
  final double? titleWidth;
  final EdgeInsets? titleMargin;
  final EdgeInsets? titlePadding;
  final String number;
  final EdgeInsets padding;
  final BoxShape shape;
  final Color? textColor;
  final Color? iconColor;
  final IconData? completedIcon;

  const StepsModel({
    required this.title,
    required this.number,
    this.titleMargin,
    this.titlePadding,
    this.titleWidth,
    this.padding = EdgeInsets.zero,
    this.shape = BoxShape.circle,
    this.textColor,
    this.iconColor,
    this.completedIcon,
  });
}
