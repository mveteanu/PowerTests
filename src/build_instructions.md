
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

  Compilation produces the following files.

  teste.exe      \
  pbeditor.exe   |
  testmake.exe   |  These files should stay in the application folder.
  times.ttf      |
  powtests.cnt   |
  powtests.hlp   /

  vcl40.bpl      -  In Windows\System folder. This file is required if the .exe files
                    were compiled with the extern RTL option

  comctl32.dll   \  These files should be placed in Windows\System or
  riched20.dll   |  in the application folder.
  ilda32.dll     /  The last .dll is required by HTML Components

  Tests\*.tst        \  Application data files can be placed in a Tests folder
  Tests\PbsFolders   /  inside the application main folder.


                                                                 VMA


