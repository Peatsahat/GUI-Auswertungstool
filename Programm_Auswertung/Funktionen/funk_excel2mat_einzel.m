function [] = funk_excel2mat_einzel()
%% Konvertieren eines einzelnen Excel-Files in Mat-Files

%% Auswahl des entsprechenden Files
%Diese File-Typen werden im Dropdown-Menü des Popup-Fensters angezeigt.
%Alternativ kann bei uigetfile anstatt Auswahl auch '*' eingetragen werden,
%dann werden automatisch immer alle Dateien angezeigt (unübersichtlich)
Auswahloption{1,1} = '*.csv'; 
Auswahloption{2,1} = '*.xls*'; %.xls, .xlsx, .xlsm...
%Für weitere File-Typen erweitern!

[load_name, load_pfad] = uigetfile(Auswahloption, 'Bitte gewünschte Excel-Datei auswählen');
if load_name==0 return, end %für Abbrechen-Button

%% Auslesen des Files
%Hier ist eine Unterscheidung zwischen '.xls*' und '.csv' nötig, da
%.csv-Files nur ein Sheet enthalten können. Bei dem Messdaten-Recorder von
%Stephan Holz sind die Messwerte bei den '.xls*'-Typen allerdings auf Sheet 2!

%ERKLÄRUNG: strfind gibt, wenn das entsprechende 'String' gefunden
%wird, dessen Position zurück, wenn es nicht gefunden wird, nichts
%([]). Entspricht die Datei load_name nicht einer der gewünschten
%Dateitypen ('.xls', '.csv'), folgt somit auf die Abfrage isempty eine
%logische 1 und nichts passiert (else), sonst läuft die if-routine ab.
if isempty(strfind(load_name, '.xls')) == 0 
    %Excel-File (kann mehrere Sheets enthalten, auch auf versteckte Sheets achten!)
    [logVal,logIDs] = xlsread([load_pfad load_name],2); %2 steht für Sheet 2!!!
else
    %CSV-File (kann nur ein Sheet enthalten!)
    [logVal,logIDs] = xlsread([load_pfad load_name]); 
    
    %Für weitere File-Typen weitere elseif-Abfragen einbauen!
end

%% Entfernen unbenötigter Spalten (z.B. Datum) und Zeilen (z.B. Momentanwert)
%-> Wichtig: Spalten der Variablennamen und der dazugehörigen Messwerte 
%müssen dann übereinstimmen (z.B. Messtelle in 'logIDs' in Spalte 1 
%sowie die dazugehörigen Messwerte in 'logVal' in Spalte 1!!!)

logVal(:,1:3) = []; %ersten 4 Spalten verwerfen (da unnütz)
logIDs(:,1:4) = []; %ersten 5 Spalten verwerfen

logVal(1,:) = []; %erste Zeile der Daten löschen
logIDs(3:size(logIDs, 1),:) = []; %nur die ersten beiden Zeilen sind wichtig

%% Auswahl des Speicherpfads
[save_name, save_pfad] = uiputfile('*.mat', 'Als Mat-File abspeichern:'); 
if save_name==0 return, end %für Abbrechen-Button

%% Abspeichern als Mat-File (Mat-Data)
save(fullfile(save_pfad, save_name), 'logIDs', 'logVal')

end %Funktionsende