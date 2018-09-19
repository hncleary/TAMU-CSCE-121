%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% load data file.m                                 %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load data file
function [ data_file ] = load_data_file()
%loads data
clear data_file
fprintf('This is where you enter the name of the data file you want to load.\n')
    
    fprintf('If you enter an invalid name, you will be prompted to enter a new name.\n')
i=0;
while i==0
try
    %input data file name
    a=inputdlg('Name of date file:','Load data file.');
    a=cell2mat(a);
    A=isempty(a);
    if A==1
        %makes sure that a data file was named
        fprintf('You need to enter the name of a data file.');
        i=0;
    else
    data_file=load(a);
    
    b=isnumeric(data_file);
    %checks name of file
       if b~=1 
        error('wrong type of data');
       end
       i=1;
    end
    
    

catch 
    %makes sure that is does not error out. 
    fprintf('The file name you entered was either:the wrong type of data, non-existence, forgot to add the .m/.txt/etc, or the file is in another folder. Please try again.\n')
end
end
clc
end

