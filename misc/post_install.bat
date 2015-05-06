@echo off

set INSTALL_DIR=C:\entermedia

echo "Setting up Environmental Variables..."
setx /M CATALINA_HOME "%INSTALL_DIR%\tomcat"
setx /M path "%INSTALL_DIR%\tools\im;%INSTALL_DIR%\tools\gs\bin;%INSTALL_DIR%\tools\lo\program;%PATH%"

echo "Installing Tomcat8 Service..."
call "%INSTALL_DIR%\tomcat\bin\service.bat" install

echo "Post Installation Complete..."
pause