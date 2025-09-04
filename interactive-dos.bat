@for %%a in (%0) do set "PROJECT_ROOT=%%~dpa"
@set DOCKER_IMAGE=jimbly/jsh-build-dos

@set REMOTE_PROJECT_ROOT=/%PROJECT_ROOT::=%
set REMOTE_PROJECT_ROOT=%REMOTE_PROJECT_ROOT:\=/%

docker run -it --rm -v %REMOTE_PROJECT_ROOT%:/project %DOCKER_IMAGE%
