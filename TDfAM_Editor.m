clc
clear
close all

%place the .gcode which you would like to edit within the same folder as
%this code is being ran from.
filename = uigetfile('*.gcode');        %specify gcode to be edited using
                                        %the ui browser, auto browse .gcode
fid = fopen(filename, 'rt+');           %open file into matlab memory
g = textscan(fid, '%s', 'Delimiter', '\n');  %scan open file, producing a
                                        %single collumn cell with each line
                                        %of code on a new row
origlinetotal = length(g{1});           %count lines of original code

%find layer changes based on Z moves
gcode = g{1};         
TF_Z=contains(gcode, 'Z');              %find lines which contain Z
Zlines = gcode(TF_Z);                   %extract those lines into a new cell
TF_G0Z=contains(Zlines, 'G0');          %AND which of those lines are move 
                                        %commands i.e. contain G0
                                        %would not work with Z-hop feature
                                        %enabled when writing gcode, make
                                        %sure z-hop is disabled

G0Zlines = Zlines(TF_G0Z);              %extract these lines, G0Z hence 
                                        % contains all "new layer" commands
[TF_lc, idx] = ismember(G0Zlines, gcode);%match these commands back to the 
                                        % original lines, 
                                        %extracting their line numbers in
                                        %idx, idx is code line number of
                                        %layer change
layercount = length(idx);               %count number of Z moves therefore 
                                        % layers
 %NOT APPROPRIATE FOR WHEN ADVANCED FEATURES LIKE "Z-HOP" ARE USED

%find extrusions based on E moves
TF_E=contains(gcode, 'E');              %All lines containing E
Elines = gcode(TF_E);
TF_G1E = contains(Elines, 'G1');        %All extrusion lines (E and G1)
G1Elines=Elines(TF_G1E);
[TF_mec, idx_2] = ismember(G1Elines, gcode); %match extrusion commands back 
                                        % to orig code
                                        %extract matching line numbers to 
                                        % idx_2
elinecount = length(idx_2);

TF_G1EF = contains(G1Elines, 'F');      %All extrusion lines with a speed 
                                        %  setting
G1EFlines = G1Elines(TF_G1EF);%!!!!!!!!!!!!
[TF_mefc, idx_3] = ismember(G1EFlines, gcode);%idx_3 is extrusions with 
                                        % speed setting line number

%find moves and speed settings based on G and F
TF_G=contains(gcode, 'G');              
Glines = gcode(TF_G);
TF_GF = contains(Glines, 'F');        
GFlines=Glines(TF_GF);
[TF_mGFc, ia] = ismember(gcode, GFlines);

iz = 1:numel(gcode);     %because there are repeating instances of G0 
                         %commands, different
                         %technique here to index G0andF, G1andF line numbers
                         %together                                        
ib = accumarray(nonzeros(ia), iz(TF_mGFc), [], @(x){x});
unsrt_idx_4=vertcat(ib{:});
idx_4 = sort(unsrt_idx_4); %line numbers for G0 and F, and G1andF

%Run GUI App to gather all inputs for editing GCode -----------------%
runApp = appTDfAM_inputUI(layercount, filename);

if isvalid(runApp)
    waitfor(runApp)
end
%done running app------------------------------------------------%
[TF_lastLayerMove, idx_5] = ismember(idx,idx_4);

if tf1 == 1                         %if user wants to vary speed
    s_s = printSpeed1*60;
    s_c = num2str(s_s);         %convert speed number to string so that 
                                %individual digits can be extracted
    for i=1:idx_5(layerNumSec2+1) %loop for number of times that there 
                                % are lines of code to edit
        b=GFlines{i};           %extract line in question to "b"
        currentSpeed = extractBetween(b,"F"," ","Boundaries","exclusive");
        GFlines{i} = replace(b, currentSpeed, s_c);
    end
    
    if secNum>1
        s_s = printSpeed2*60;
        s_c = num2str(s_s);
        if secNum==2
            upperLim=idx_5(layercount);
        else
            upperLim=idx_5(layerNumSec3+1);
        end
        for i=(idx_5(layerNumSec2+1)+1):upperLim      %loop for number of 
                               % times that there are lines of code to edit
            b=GFlines{i};      %extract line in question to "b"
            currentSpeed = extractBetween(b,"F"," ","Boundaries","exclusive");
            GFlines{i} = replace(b, currentSpeed, s_c);
        end
    end
    if secNum>2
        s_s = printSpeed3*60;
        s_c = num2str(s_s);
        if secNum==3
            upperLim=idx_5(layercount);
        else
            upperLim=idx_5(layerNumSec4+1);
        end
        for i=(idx_5(layerNumSec3+1)+1):upperLim 
            b=GFlines{i};          
            currentSpeed = extractBetween(b,"F"," ","Boundaries","exclusive");
            GFlines{i} = replace(b, currentSpeed, s_c);
        end
    end
    if secNum>3
        if secNum==4
            upperLim=idx_5(layercount);
        else
            upperLim=idx_5(layerNumSec5+1);
        end
        s_s = printSpeed4*60;
        s_c = num2str(s_s);
        for i=(idx_5(layerNumSec4+1)+1):upperLim      
            b=GFlines{i};          
            currentSpeed = extractBetween(b,"F"," ","Boundaries","exclusive");
            GFlines{i} = replace(b, currentSpeed, s_c);
        end
    end
    if secNum>4
        s_s = printSpeed5*60;
        s_c = num2str(s_s);
        for i=(idx_5(layerNumSec5+1)+1):idx_5(layercount)      
            b=GFlines{i};          
            currentSpeed = extractBetween(b,"F"," ","Boundaries","exclusive");
            GFlines{i} = replace(b, currentSpeed, s_c);
        end
    end
    for i=1:length(idx_4)       
        gcode(idx_4(i),:)=GFlines(i); 
    end

end

if TF4==1
    if secNum == 5
        layerNumSec = [layerNumSec2,layerNumSec3,layerNumSec4, layerNumSec5];
    elseif secNum == 4
        layerNumSec = [layerNumSec2,layerNumSec3,layerNumSec4];
    elseif secNum == 3
        layerNumSec = [layerNumSec2,layerNumSec3];
    elseif secNum == 2
        layerNumSec = layerNumSec2;
    end
    for i=1:layercount                       
        a = length(gcode) - origlinetotal;
        %disp(a);
        if i==1
            cln = idx(i,1);    %define the code line number to inject new 
                               % code
        else
            cln = idx(i,1)+(a);%redefine code line number as new code 
                               % has been injected
        end
        
        if i==1                       
            sec=1;
            T_c = nozTemp1;  %initial temp set for first layer
            for n=1:3
             gcode(cln+1:end+1,:) = gcode(cln:end,:); %push the rows of the 
                  % Z instance and onwards down 3 rows, creating blank rows
            end
            gcode(cln,:) = {"M104 S" + num2str(T_c)};  %Set new temp
            gcode(cln+1,:) = {"G28 X Y"};              %home X and Y axis 
                                                    % whilst heating nozzle
            gcode(cln+2,:) = {"M109 S" + num2str(T_c)};%Set new temp and
                              % wait for heating until executing next gcode
            sec=sec+1;
        elseif any(i==layerNumSec) %if layer number is a multiple of number 
                                        % of layers after which to vary temp
            if secNum>1
                if sec==2
                    T_c = nozTemp2;
                elseif sec == 3
                    T_c = nozTemp3;
                elseif sec==4
                    T_c=nozTemp4;
                elseif sec==5
                    T_c=nozTemp5;
                end
                for n=1:3
                 gcode(cln+1:end+1,:) = gcode(cln:end,:); 
                end
                gcode(cln,:) = {"M104 S" + num2str(T_c)};  
                gcode(cln+1,:) = {"G28 X Y"};              
                gcode(cln+2,:) = {"M109 S" + num2str(T_c)};
                sec=sec+1;
            end
        end
    end
end


%Name file
newfile = newFileName + ".gcode"; %add back the file extension
fid2 = fopen(newfile, 'wt+');  
fprintf(fid2,'%s\n',gcode{:});%write the entirety of "gcode" to the text file

fclose('all');

disp('Your edited file: ' + newfile + ' has been successfully saved!')    
