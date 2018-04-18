::The main idea behind using command based deleting is that we will be safe from the viruses getting into the system, this way we will able to directly delete files
:: the files which looks threats to you. This is handy for those people who dont want heavy antiviruses popping here and there. Enjoy!!
:: Made with love in Nepal. 
@echo off
title Virus Scanner 1.1
echo Made with love in Nepal
color 70

:Menu 
cls
echo+
echo Choose: 
echo [A] Choose your removable disk
echo [B] Check for viruses, trojans and worms
echo [Q] Quit 
echo+

:Choose 
SET /P C=[A,B,Q]: 
:: If A is choosen the it goes to :ChoosingDisk section
for %%? in (A) do if /I "%C%"=="%%?" goto :ChoosingDisk 
:: If B is choosen the it goes to :ReadDisk section
for %%? in (B) do if /I "%C%"=="%%?" goto :ReadDisk
:: If Q is choosen the it goes to :End section
for %%? in (Q) do if /I "%C%"=="%%?" goto :End
goto :Menu 

:ChoosingDisk
@echo off
cls
title Choose Your Disk
wmic logicaldisk get deviceid, volumename, description
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo   This will now show the hidden folders, infected files, trojans, worms, viruses.
echo    You would be able to manually delete those files which you see threat. 
echo     We will do the rest i.e empty folders would be removed automatically. 
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
pause
:: This sets "disk" as a variable to store the input letter
set /p "disk=Enter your disk: "
:: It changes the directory to inputted drive
chdir /d "%disk%:"
:: This creates the attribute to the disk, for more "type attrib /?" in cmd, HINT: This is the main working idea here
attrib -r -a -s -h -i -x *.* /s /d /l
:: It deletes the empty folders of that root disk drive
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" 2> NUL
cls
title Delete Potential Threats
echo To delete a file, just simply type "del" one space and name of that file
echo For example: del Avast.exe this will delete the Avast.exe from the disk
echo to exit from this type "exit".Press something now if you understood!
echo Thankyou!
pause
cls
echo TYPE "del" TO DELETE
echo TYPE "exit" TO EXIT 
dir
cmd
pause
goto :Menu

:ReadDisk
@echo off
title Virus Scanner
color 72
cls
echo Here are the drives present in this computer.
wmic logicaldisk get deviceid, volumename
:: This is same shitty code explained above 
set /p "disk=Enter the disk: "
:: This does the same, find above, i dont know why im commenting
chdir /d "%disk%:"
title Showing Inside %disk%:
echo TYPE "del" TO DELETE
echo TYPE "exit" TO EXIT 
echo ++++++++++++++++++++++++++++++
dir
cmd
pause
goto :Menu

:End
cls
title Quitting
echo MADE WITH LOVE IN NEPAL.
echo Bye!
pause
exit 