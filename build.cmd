setlocal
call %~dp0..\vc_setup.cmd
pushd %~dp0expat
set BUILD=build
title Configuring Expat
%CMAKE% -S . -B %BUILD%
call :do_build Debug d
call :do_build Release
title Done building Expat
cd ..
PdbIndexer %DEPS_SOURCE_URL%/libexpat
NuGet.exe pack expat.nuspec -OutputDirectory %PACKAGES%\nuget_packages
popd
endlocal

goto:eof

:do_build
  title Building Expat %1
  msbuild /m %BUILD%\expat.sln -p:Configuration=%1
  goto:eof
