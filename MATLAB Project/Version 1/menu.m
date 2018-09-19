%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/04/16                                         %
% Week 19                                          %
% matlab project.m                                 %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%matlab project

%sets defualt outputs 
continueProgram = true;
CreateStruct.Interpreter = 'tex';
CreateStruct.WindowStyle = 'modal';
probability='';
leter_choose='Not set.';
point='';
message2='';




% This while loop will continue to loop until continueProgram becomes false 
while continueProgram
    % Clear the screen
    % This makes the menu interactions a bit cleaner
    clc;
    
    % Display the menu to the user
	%print_menu_options;
    fprintf('What do you want to do?\n');
    fprintf('1) Set user name\n');
    fprintf('2) Load data file\n');
    fprintf('3) Clear data from memory\n');
    fprintf('4) Set output filename\n');
    fprintf('5) Plot histogram\n');
    fprintf('6) Plot histogram fit\n');
    fprintf('7) Plot probability plots\n');
    fprintf('8) Regression of y on x\n');
    fprintf('9) Find probability given x or z\n');
    fprintf('10) Find x or z given probability\n');
    fprintf('11) Exit\n');
    % Print prompt
    fprintf('Enter your choice: ');
    
    % Get user input
    % For safety, read as a string to prevent MATLAB from evaluating input
	choice = input('','s');
    switch choice;
        case '1'
            % set user name
			user_name=username();
		case '2'
            % load data
			data_file=load_data_file();
            [my_Mean, my_Median, my_Mode, my_Var, my_Stdev, my_Min, my_Max, my_Count, Message] = stats( data_file );
		case '3'
            % clear all
			clear all; close all; clc; continueProgram = true; CreateStruct.Interpreter = 'tex'; CreateStruct.WindowStyle = 'modal'; probability='';leter_choose='Not set.'; point=''; message2=''; 
		case '4'
            % set output file name
			[fileID, file_name] = set_output_filename();
        case '5'
            % make histogram
			my_Folder=exist('data_file');
                if my_Folder ~= 0
                 make_Histogram( data_file );
                else 
                 
                msgbox({'Data file is not loaded. Cant plot a histagram' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                
                end
		case '6'
            % plots a histogram fit
			my_Hist=exist('data_file');
                if my_Hist ~= 0
                 my_Histfit( data_file );
                else 
                 msgbox({'Data file is not loaded. Cant plot a histagram' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                fprintf('Press any key to continue');
                end
		case '7'
            % plots normal distribution
			my_Norm=exist('data_file');
                if my_Norm ~= 0
                 make_Normplot( data_file );
                else   
                msgbox({'Data file is not loaded. Cant plot a normplot' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                fprintf('Press any key to continue');
                end
		case '8'
            % plots reagresion 
			my_Folder=exist('data_file');
                if my_Folder ~= 0
                 regress_YX( data_file );
                else 
                 
                msgbox({'Data file is not loaded. Cant plot a regression' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                end
        case '9'
            % finds probablity
			my_Prob=exist('data_file');
                if my_Prob ~= 0
                [ message2 , probability ] = find_Prob( data_file, my_Mean, my_Stdev );
                else   
                msgbox({'Data file is not loaded. Cant find probablity.' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                fprintf('Press any key to continue');
                end
		case '10'
            % finds point
			my_Folder=exist('data_file');
                if my_Folder ~= 0
                 [ point , leter_choose ] = my_Point( data_file , my_Mean , my_Stdev );
                else 
                 
                msgbox({'Data file is not loaded. Cant find point.' 'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                pause;
                end
		case '11'
            % exits program
            % checkst to mske sure all outputs are set.  
			my_data=exist('data_file');
                my_username=exist('user_name');
                    my_filename=exist('file_name');
                        my_fileID=exist('fileID');
                            my_message2=exist('message2');
                                my_probability=exist('probability');
                                    my_leter_choose=exist('leter_choose');
                                        my_point=exist('point');
                 if my_data ~= 0
                    if my_username ~= 0
                        if my_filename ~= 0
                            if my_fileID ~= 0
                                if my_message2 ~= 0
                                    if my_probability ~= 0
                                        if my_leter_choose ~= 0
                                            if my_point ~= 0
                                continueProgram = false;
                            else
                            msgbox({'The point has not been found. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                            pause;
                            fprintf('Press any key to continue');
                            end
                        else
                        msgbox({ 'The leter has not been set. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                        pause;
                        fprintf('Press any key to continue');
                        end
                    else
                    msgbox({'The probablity has not been found. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                    pause;
                    fprintf('Press any key to continue');
                    end
                else 
                msgbox({'The probablity has not been found. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'} ,'Error','error',CreateStruct)
                pause;
                fprintf('Press any key to continue');
                end             
			else
                            msgbox({'The output file has not been set. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                            pause;
                            fprintf('Press any key to continue');
                            end
                        else
                        msgbox({'The output file has not been set. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                        pause;
                        fprintf('Press any key to continue');
                        end
                    else
                    msgbox({'The username was not assigned. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'},'Error','error',CreateStruct)
                    pause;
                    fprintf('Press any key to continue');
                    end
                else 
                msgbox({'The data has not been loaded. Cant exit the program.'  'Click "OK" or hit "Enter" then Press any key to continue.'} ,'Error','error',CreateStruct)
                pause;
                fprintf('Press any key to continue');
                end
        otherwise
            % This case handles invalid input
			fprintf('\nERROR: Please enter an integer between 1 and 11\n\n');
            
            % Wait for user to acknowledge the error message
            fprintf('Press any key to continue');
            pause;
    % Determine which action to take based on the user's input
    switch choice
		
    end % end of switch
    end
end% end of while

% clean up after ourselves
clc;
clear done choice;
% Prints to output file
l=fprintf(fileID,'File name: ');
l=fprintf(fileID, file_name);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Username: ');
l=fprintf(fileID, user_name);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Date: ');
l=fprintf(fileID,date);
l=fprintf(fileID,'\n');
l=fprintf(fileID, 'Stats:\n');
l=fprintf(fileID, 'Mean  = ');
l=fprintf(fileID, '%.2f',my_Mean);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Median= ');
l=fprintf(fileID, '%.2f',my_Median);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Mode  = ');
l=fprintf(fileID,'%.2f',my_Mode);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Var   = ');
l=fprintf(fileID,'%.2f',my_Var);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Stdev = ');
l=fprintf(fileID,'%.2f',my_Stdev);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Message: ');
l=fprintf(fileID, Message);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Min   = ');
l=fprintf(fileID,'%.2f',my_Min);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Max   = ');
l=fprintf(fileID,'%.2f',my_Max);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Count = ');
l=fprintf(fileID,'%.2f',my_Count);
l=fprintf(fileID,'\n');
l=fprintf(fileID,message2);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Probablity = ');
l=fprintf(fileID,'%.2f',probability);
l=fprintf(fileID,'\n');
l=fprintf(fileID,'Point: ');
l=fprintf(fileID,'%s = ',leter_choose);
l=fprintf(fileID,'%f \n',point);
%shows in command window
l=fprintf('Stats:\n');
l=fprintf('Mean  = ');
l=fprintf('%.2f',my_Mean);
l=fprintf('\n');
l=fprintf('Median= ');
l=fprintf('%.2f',my_Median);
l=fprintf('\n');
l=fprintf('Mode  = ');
l=fprintf('%.2f',my_Mode);
l=fprintf('\n');
l=fprintf('Var   = ');
l=fprintf('%.2f',my_Var);
l=fprintf('\n');
l=fprintf('Stdev = ');
l=fprintf('%.2f',my_Stdev);
l=fprintf('\n');
fprintf(Message)
l=fprintf('\n');
l=fprintf('Min   = ');
l=fprintf('%.2f',my_Min);
l=fprintf('\n');
l=fprintf('Max   = ');
l=fprintf('%.2f',my_Max);
l=fprintf('\n');
l=fprintf('Count = ');
l=fprintf('%.2f',my_Count);
l=fprintf('\n');
l=fprintf(message2);
l=fprintf('\n');
l=fprintf('Probablity = ');
l=fprintf('%.2f \n',probability);
l=fprintf('\n');
l=fprintf('Point: ');
l=fprintf('%s = ',leter_choose);
l=fprintf('%f \n',point);
clear all;


