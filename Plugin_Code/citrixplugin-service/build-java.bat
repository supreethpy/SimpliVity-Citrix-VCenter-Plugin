@echo off
REM --- Windows script starting an Ant build of the current Java project
REM --- (if Ant runs out of memory try defining ANT_OPTS=-Xmx512M)

@IF not defined ANT_HOME (
   @echo BUILD FAILED: You must set the env variable ANT_HOME to your Apache Ant folder
   goto end
)
@IF not defined VSPHERE_SDK_HOME (
   @echo BUILD FAILED: You must set the env variable VSPHERE_SDK_HOME to your vSphere Web Client SDK folder
   goto end
)
@IF not exist "%VSPHERE_SDK_HOME%\libs\vsphere-client-lib.jar" (
   @echo BUILD FAILED: VSPHERE_SDK_HOME is not set to a valid vSphere Web Client SDK folder
   @echo %VSPHERE_SDK_HOME%\libs\vsphere-client-lib.jar is missing
   goto end
)

@call "%ANT_HOME%\bin\ant" -f build-java.xml

:end
