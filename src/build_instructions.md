
Build instructions
==================

To compile PowerTests you need:

- Borland Delphi v??

Also the following 3rd party components are required:

- ColorBtn
- RichEdit 98
- RxLib 2.60
- Tb97
- TipDlg
- WordCap

In addition, Control Center requires:

- LMD
- Orpheus 3
- SysTools
- HTML components

The program help is created with:

- Help&Manual 2.0


Output files
============

  After compilation you should arrange the files like this:

  Application folder:
  -------------------

  - teste.exe
  - pbeditor.exe
  - testmake.exe
  - times.ttf
  - powtests.cnt
  - powtests.hlp

Windows\System folder
---------------------

  - vcl40.bpl      
  
  This file is required if the .exe files were compiled with the extern RTL option

  - comctl32.dll
  - riched20.dll
  - ilda32.dll
  
  These files should be placed in Windows\System or in the application folder. The last .dll is required by HTML Components


Application data
----------------

  - Tests\*.tst
  - Tests\PbsFolders

                                                                 VMA
