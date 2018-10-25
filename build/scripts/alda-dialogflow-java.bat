@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  alda-dialogflow-java startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and ALDA_DIALOGFLOW_JAVA_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\gs-gradle-0.1.0.jar;%APP_HOME%\lib\google-cloud-dialogflow-0.67.0-alpha.jar;%APP_HOME%\lib\google-cloud-core-grpc-1.49.0.jar;%APP_HOME%\lib\google-cloud-core-1.49.0.jar;%APP_HOME%\lib\proto-google-cloud-dialogflow-v2beta1-0.32.0.jar;%APP_HOME%\lib\proto-google-cloud-dialogflow-v2-0.32.0.jar;%APP_HOME%\lib\grpc-netty-shaded-1.13.1.jar;%APP_HOME%\lib\gax-grpc-1.32.0.jar;%APP_HOME%\lib\grpc-stub-1.13.1.jar;%APP_HOME%\lib\grpc-auth-1.13.1.jar;%APP_HOME%\lib\gax-1.32.0.jar;%APP_HOME%\lib\proto-google-iam-v1-0.12.0.jar;%APP_HOME%\lib\api-common-1.7.0.jar;%APP_HOME%\lib\protobuf-java-util-3.6.1.jar;%APP_HOME%\lib\grpc-protobuf-1.13.1.jar;%APP_HOME%\lib\grpc-protobuf-lite-1.13.1.jar;%APP_HOME%\lib\grpc-core-1.13.1.jar;%APP_HOME%\lib\google-auth-library-oauth2-http-0.11.0.jar;%APP_HOME%\lib\guava-20.0.jar;%APP_HOME%\lib\joda-time-2.9.2.jar;%APP_HOME%\lib\google-http-client-jackson2-1.24.1.jar;%APP_HOME%\lib\google-http-client-1.24.1.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\proto-google-common-protos-1.12.0.jar;%APP_HOME%\lib\google-auth-library-credentials-0.11.0.jar;%APP_HOME%\lib\protobuf-java-3.6.1.jar;%APP_HOME%\lib\grpc-context-1.13.1.jar;%APP_HOME%\lib\httpclient-4.5.3.jar;%APP_HOME%\lib\threetenbp-1.3.3.jar;%APP_HOME%\lib\gson-2.7.jar;%APP_HOME%\lib\error_prone_annotations-2.1.2.jar;%APP_HOME%\lib\opencensus-contrib-grpc-metrics-0.12.3.jar;%APP_HOME%\lib\opencensus-api-0.12.3.jar;%APP_HOME%\lib\httpcore-4.4.6.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\jackson-core-2.9.2.jar

@rem Execute alda-dialogflow-java
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %ALDA_DIALOGFLOW_JAVA_OPTS%  -classpath "%CLASSPATH%" com.example.dialogflow.DetectIntentTexts %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable ALDA_DIALOGFLOW_JAVA_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%ALDA_DIALOGFLOW_JAVA_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
