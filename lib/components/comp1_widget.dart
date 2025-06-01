import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'comp1_model.dart';
export 'comp1_model.dart';

class Comp1Widget extends StatefulWidget {
  const Comp1Widget({
    super.key,
    this.icon,
    String? text,
  }) : this.text = text ?? ' ';

  final Widget? icon;
  final String text;

  @override
  State<Comp1Widget> createState() => _Comp1WidgetState();
}

class _Comp1WidgetState extends State<Comp1Widget> {
  late Comp1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Comp1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: 80.0,
        height: 80.0,
        constraints: BoxConstraints(
          maxWidth: valueOrDefault<double>(
            () {
              if (MediaQuery.sizeOf(context).width >= 1392.0) {
                return (MediaQuery.sizeOf(context).width * 0.333);
              } else if (MediaQuery.sizeOf(context).width >= 976.0) {
                return (MediaQuery.sizeOf(context).width * 0.5);
              } else {
                return MediaQuery.sizeOf(context).width;
              }
            }(),
            376.0,
          ),
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon!,
            Text(
              widget.text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.robotoFlex(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 6.0)),
        ),
      ),
    );
  }
}
