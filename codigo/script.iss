; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "V-Audio"
#define MyAppIcon "img\icone_prin.ico"
#define MyAppVersion "1.5"
#define MyAppPublisher "LordDoug Programmer"
#define MyAppURL "https://github.com/DougVikt/APP_V-AUDIO"
#define MyAppExeName "v-audio.exe"
#define MyAppAssocName MyAppName + " File"
#define MyAppAssocExt ".myp"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{626737AE-F048-4EA2-A082-2E869CE5B565}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppComments=Permite atribuir atalhos para alterar o volume da saida de audio 
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
ChangesAssociations=yes
DisableProgramGroupPage=yes
LicenseFile=build\V-Audio_V1.5\frozen_application_license.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\USUARIO\Downloads
OutputBaseFilename=V-Audio
SetupIconFile=img\icone_prin.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*.*"; 
Type: dirifempty; Name: "{app}"

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\frozen_application_license.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\v-audio.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\python3.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\python310.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\lib\*"; DestDir: "{app}\lib"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\USUARIO\Documents\PROGRAMA��O\CODIGOS2\APP_V-AUDIO\codigo\build\V-Audio_V1.5\img\*"; DestDir: "{app}\img"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppIcon}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\{#MyAppIcon}" ;Tasks: desktopicon
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}" ; IconFilename: "{app}\{#MyAppIcon}"
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\{#MyAppIcon}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function InitializeUninstall: Boolean;
begin
  Result := True;
  
  // Encerra o processo do aplicativo em execu��o, se estiver rodando
  if Exec(ExpandConstant('{sys}\taskkill.exe'), '/F /IM ' + ExpandConstant('{#MyAppExeName}'),'', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
  begin
    Log('Aplicativo em execu��o (' + ExpandConstant('{#MyAppExeName}') + ') foi encerrado.');
  end
  else
  begin
    Log('N�o foi poss�vel encerrar o aplicativo em execu��o (' + ExpandConstant('{#MyAppExeName}') + ').Por favor feche � aplica��o antes de continuar a desinstala��o');
  end;
end;
