%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% set output filename.m                            %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%set_output_filename
function [ fileID, file_name ] = set_output_filename()
c=0;
%gives the user that instructions
fprintf('This is where you enter the name of the output file.\n')
    
    fprintf('If you  enter an invalid name, you will be prompted to enter a new name.\n')
while c==0

%user enters name    
potential_file_name=inputdlg('Enter the name of the file you want to be your output file.','Output file');
a=whos('potential_file_name');
potential_file_name=cell2mat(potential_file_name);
b=isempty(potential_file_name);
if b==0
    %makes sure user entered a name.
 file_name=potential_file_name
 fileID=fopen(file_name,'w')
    c=1;
else
    %tells the user the name they enterted is wrong
    fprintf('%d is not valid file name; please enter a new file name.\n\n',potential_file_name)
end
    
end

clc

end

