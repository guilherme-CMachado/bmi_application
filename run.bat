@echo off
set arg1=%1
IF %arg1% == hml (
    %FLUTTER_PATH%\flutter.bat run lib/main_hml.dart
) ELSE IF %arg1% == prod (
    %FLUTTER_PATH%\flutter.bat run lib/main_prod.dart
) ELSE (
    %FLUTTER_PATH%\flutter.bat run lib/main_dev.dart
)