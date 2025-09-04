@for %%a in (%0) do set "PROJECT_ROOT=%%~dpa"

@set DOCKER_IMAGE=jimbly/jsh-build-win32
@REM Disabled for quicker iteration:
@REM docker build -t %DOCKER_IMAGE% -f %PROJECT_ROOT%/Dockerfile.win32 .

@set REMOTE_PROJECT_ROOT=/%PROJECT_ROOT::=%
set REMOTE_PROJECT_ROOT=%REMOTE_PROJECT_ROOT:\=/%

( docker run -i --rm -v %REMOTE_PROJECT_ROOT%:/project %DOCKER_IMAGE% stdbuf -oL -eL /project/in_docker_build.sh Makefile.win32 %* && touch linux_build_succeeded.tmp )

@if EXIST linux_build_succeeded.tmp (
	@del linux_build_succeeded.tmp
	@echo Docker build finished successfully
	@exit /b 0
)
@exit /b 1
