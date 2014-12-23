set startdir=%cd%

echo %startdir%

cd %startdir%\selenium_grid

START /B CMD /C CALL "hub.bat"

START /B CMD /C CALL "firefox.bat"
