' Abby Desktop Pet - silent launcher (no console window)
' Double-click this file to start the pet with no black console window.
Option Explicit

Dim ws, fs, app, exe
Set ws = CreateObject("WScript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")

app = fs.GetParentFolderName(WScript.ScriptFullName)
ws.CurrentDirectory = app
exe = app & "\node_modules\electron\dist\electron.exe"

If Not fs.FileExists(exe) Then
  ' First run: download the Electron binary, then continue.
  ws.Run "cmd.exe /c cd /d """ & app & """ & npm install --no-audit --no-fund", 1, True
End If

If fs.FileExists(exe) Then
  ws.Run """" & exe & """ .", 0, False
Else
  MsgBox "Electron binary is missing. Please run the .bat launcher once to install it.", 16, "Abby Desktop Pet"
End If
