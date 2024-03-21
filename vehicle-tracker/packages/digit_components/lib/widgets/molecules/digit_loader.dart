import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loaders {
  static circularLoader(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SimpleDialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Loading...',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                )
              ]),
        ));
  }

  static Future<void> showLoadingDialog(
    BuildContext context, {
    String? label,
  }) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SimpleDialog(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    children: <Widget>[
                      Center(
                        child: Column(children: [
                          CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            label ?? 'Loading...',
                            style: const TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                      )
                    ]),
              ));
        });
  }

  static void showLoader(BuildContext context, {String? text}) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              // backgroundColor:CustomColors.BLACK,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: WillPopScope(
                onWillPop: () async {
                  return true;
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Wrap(
                      runSpacing: 15,
                      alignment: WrapAlignment.center,
                      children: [
                        const SpinKitCircle(
                          color: Colors.white,
                          size: 50.0,
                        ),
                        Text(
                          text ??
                              ' Getting image data \n  Please check the values once done. ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
          );
        });
  }
}

class DigitLoader extends StatefulWidget {
  const DigitLoader({super.key});

  @override
  State<StatefulWidget> createState() {
    return DigitLoaderState();
  }
}

class DigitLoaderState extends State<DigitLoader> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Loaders.showLoadingDialog(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
