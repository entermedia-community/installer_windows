@echo off
set INSTALL_DIR=C:\Entermedia
md %INSTALL_DIR%
md %INSTALL_DIR%\webapp\ROOT

echo "Downloading Entermedia ROOT.zip..."
bitsadmin.exe /transfer "Entermedia App" http://dev.entermediasoftware.com/jenkins/view/Demo/job/demoall/lastSuccessfulBuild/artifact/deploy/ROOT.war %INSTALL_DIR%\webapp\ROOT\ROOT.zip

echo "Unzipping ROOT.zip..."
call "misc\unzip.bat"

echo "Removing ROOT.zip file..."
del "%INSTALL_DIR%\webapp\ROOT\ROOT.zip"

echo "Copying dependencies..."
xcopy /S /I /E "webapp\WEB-INF\bin\windows" "%INSTALL_DIR%\webapp\ROOT\WEB-INF\bin\windows"

if exist "%INSTALL_DIR%\webapp\WEB-INF\bin\commandmap.xml" (
	del "%INSTALL_DIR%\webapp\WEB-INF\bin\commandmap.xml"
)
copy "webapp\WEB-INF\bin\commandmap.xml" "%INSTALL_DIR%\webapp\ROOT\WEB-INF\bin\commandmap.xml"

xcopy /S /I /E "tomcat" "%INSTALL_DIR%\tomcat"

echo "Setting up Environmental Variables..."

setx -m CATALINA_HOME "%INSTALL_DIR%\tomcat"

echo "Start up Tomcat"

call "%INSTALL_DIR%\tomcat\bin\startup.bat"