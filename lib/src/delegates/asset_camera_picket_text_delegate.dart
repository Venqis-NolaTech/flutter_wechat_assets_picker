import 'dart:ui';

import 'package:wechat_camera_picker/wechat_camera_picker.dart';

/// All text delegates.
const List<CameraPickerTextDelegate> cameraPickerTextDelegates =
    <CameraPickerTextDelegate>[
  CameraPickerTextDelegate(),
  EnglishCameraPickerTextDelegate(),
  SpanishAssetPickerTextDelegate(),
];

/// Obtain the text delegate from the given locale.
CameraPickerTextDelegate cameraPickerTextDelegateFromLocale(Locale? locale) {
  if (locale == null) {
    return const CameraPickerTextDelegate();
  }
  final String languageCode = locale.languageCode.toLowerCase();
  for (final CameraPickerTextDelegate delegate in cameraPickerTextDelegates) {
    if (delegate.languageCode == languageCode) {
      return delegate;
    }
  }
  return const CameraPickerTextDelegate();
}

/// Text delegate implements with Spanish.
class SpanishAssetPickerTextDelegate extends CameraPickerTextDelegate {
  const SpanishAssetPickerTextDelegate();

  @override
  String get languageCode => 'es';

  @override
  String get confirm => 'Confirmar';

  @override
  String get shootingTips => 'Toca para tomar una foto.';

  @override
  String get shootingWithRecordingTips =>
      'Toque para tomar una foto. Mantenga presionado para grabar video.';

  @override
  String get shootingOnlyRecordingTips =>
      'Mantenga presionado para grabar video.';

  @override
  String get shootingTapRecordingTips => 'Toca para grabar video.';

  @override
  String get loadFailed => 'Carga fallida';

  @override
  String get sActionManuallyFocusHint => 'enfocar manualmente';

  @override
  String get sActionPreviewHint => 'preview';

  @override
  String get sActionRecordHint => 'record';

  @override
  String get sActionShootHint => 'take picture';

  @override
  String get sActionShootingButtonTooltip => 'shooting button';

  @override
  String get sActionStopRecordingHint => 'stop recording';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)} camera preview';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'Flash mode: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      'Switch to the ${sCameraLensDirectionLabel(value)} camera';
}
