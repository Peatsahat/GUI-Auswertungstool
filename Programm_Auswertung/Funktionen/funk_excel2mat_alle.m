function [] = funk_excel2mat_alle()
%% Konvertieren aller Excel-Files eines Ordners in Mat-Files

%% Auswahl des Verzeichnisses mit den zu konvertierenden Excel-Files
load_pfad = uigetdir('', 'Wählen Sie den ORDNER mit den zu konvertierenden EXCEL-FILES aus:');
if load_pfad==0 return, end %für Abbrechen-Button
Files = dir(load_pfad);

%% Auswahl des Zielverzeichnisses für die erzeugten Mat-Files
save_pfad = uigetdir('', 'Wählen Sie den ZIELORDNER für die MAT-FILES aus:');

%% Auslesen der Excel-Files und Abspeichern als Mat-Files mit gleichem Namen
for i = 1:length(Files)
    
    %if-Abfrage, um nur Excel-Files zu öffnen, Unterordner und andere
    %Dateitypen werden ignoriert

    %ERKLÄRUNG: strfind gibt, wenn das entsprechende 'String' gefunden
    %wird, dessen Position zurück, wenn es nicht gefunden wird, nichts
    %([]). Entspricht die Datei Files(i).name nicht einer der gewünschten
    %Dateitypen ('.xls', '.csv'), folgt somit auf die Abfrage isempty eine
    %logische 1 und nichts passiert (else), sonst läuft die if-routine ab.
    if isempty(strfind(Files(i).name, '.xls')) == 0 || isempty(strfind(Files(i).name, '.csv')) == 0

        %% Auslesen des Files
        %Hier ist eine Unterscheidung zwischen '.xls*' und '.csv' nötig, da
        %.csv-Files nur ein Sheet enthalten können. Bei dem Messdaten-Recorder von
        %Stephan Holz sind die Messwerte bei den '.xls*'-Typen allerdings auf Sheet 2!

        %ERKLÄRUNG: strfind gibt, wenn das entsprechende 'String' gefunden
        %wird, dessen Position zurück, wenn es nicht gefunden wird, nichts
        %([]). Entspricht die Datei Files(i).name nicht einer der gewünschten
        %Dateitypen ('.xls', '.csv'), folgt somit auf die Abfrage isempty eine
        %logische 1 und nichts passiert (else), sonst läuft die if-routine ab.
        if isempty(strfind(Files(i).name, '.xls')) == 0 
            %Excel-File (kann mehrere Sheets enthalten, auch auf versteckte Sheets achten!)
            [logVal,logIDs] = xlsread([load_pfad '\' Files(i).name],2); %2 steht für Sheet 2!!!
        else
            %CSV-File (kann nur ein Sheet enthalten!)
            [logVal,logIDs] = xlsread([load_pfad '\' Files(i).name]); 

            %Für weitere File-Typen weitere elseif-Abfragen einbauen!
        end

        %% Entfernen unbenötigter Spalten (z.B. Datum) und Zeilen (z.B. Momentanwert)
        %-> Wichtig: Spalten der Variablennamen und der dazugehörigen Messwerte 
        %müssen dann übereinstimmen (z.B. Messtelle in 'logIDs' in Spalte 1 
        %sowie die dazugehörigen Messwerte in 'logVal' in Spalte 1!!!)

        logVal(:,1:3) = []; %ersten 4 Spalten verwerfen (da unnütz)
        logIDs(:,1:4) = []; %ersten 5 Spalten verwerfen

        logVal(1,:) = []; %erste Zeile der Daten löschen
        logIDs(3:size(logIDs, 1),:) = []; %nur die ersten Zeilen sind wichtig

        %% Abspeichern als Mat-File (Mat-Data)
        %Generieren eines Dateinamens, der den ursprünglichen Dateityp
        %('.xls', '.csv') nicht mehr enthält, da sonst nicht als Mat-File
        %abgespeichert wird, sondern als ursprünglicher Dateityp!
        
        %ANMERKUNG: enthalten die Dateinamen durch Zufall die zu löschenden
        %Endungen, kann das hier zu Fehlern führen!!! -> andere Lösung
        %suchen!
        
        %ERKLÄRUNG: strfind findet die Position der Endung im Dateinamen,
        %danach wird alles gelöscht (hier könnte der eben genannte Fehler
        %auftreten!). '.xls' erschlägt somit auch Excelformate wie '.xlsm'
        %oder '.xlsx' usw.
        
        Files(i).name(strfind(Files(i).name, '.xls'):length(Files(i).name)) = [];
        Files(i).name(strfind(Files(i).name, '.csv'):length(Files(i).name)) = [];
        
        save(fullfile(save_pfad, [Files(i).name '.mat']), 'logIDs', 'logVal')

    else %hier passiert nichts
    end %End if-Bedingungen
end  %End for-Schleife

end %Funktionsende

