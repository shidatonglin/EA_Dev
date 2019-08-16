# How to build a dev environment for EA development using vscode

1. c_cpp_properties.json to add include path for mql
  {
    "configurations": [
        {
            "name": "Win32",
            "includePath": [
                "${workspaceFolder}/**",
                "C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5\\Include"
            ],
         }
      ]
   }
   
 2. Add biild.bat file for build your mql source file 
 
  
set metaeditor="C:\\Program Files\\MetaTrader 5\\metaeditor64.exe"
set include_path="C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5"

set file_path=%1
set file_path=%file_path:"=%
set file_name=%2
set file_name=%file_name:"=%
set file_ext=%3
set file_ext=%file_ext:"=%
set command=%4

%metaeditor% /compile:"%file_path%\%file_name%%file_ext%" /inc:%include_path% %command% /log

type "%file_path%\%file_name%.log"
del "%file_path%\%file_name%.log"

  3. Add  task.json file to tell vs code run the build task
  
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build_mql",
            "type": "shell",
            "windows": {
                "command": ".\\.vscode\\build.bat"
            },
            "args": [
                "${fileDirname}",
                "${fileBasenameNoExtension}",
                "${fileExtname}"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "reveal": "always",
                "panel": "shared"
            },
            "problemMatcher": []
        },
        {
            "label": "Compile-Project-X",
            "type": "shell",
            "command": "C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5\\Compile-MQL.ps1  C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5\\Experts\\ProjectX\\ProjectX.mq5",
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            }
        },
        {
            "label": "Compile-MQL",
            "type": "shell",
            "command": "C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\D0E8209F77C8CF37AD8BF550E51FF075\\MQL5\\Compile-MQL.ps1 ${file}",
            "presentation": {
                "echo": true,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "launch_offline_help",
            "type": "shell",
            "presentation": {
                "echo": false,
                "reveal": "silent",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
            "command": "hh.exe",
            "args": [
                "C:\\Users\\ttong017\\AppData\\Roaming\\MetaQuotes\\Terminal\\Help\\mql5.chm::/${selectedText}.htm"
            ]
        }
    ]
}
 
            
