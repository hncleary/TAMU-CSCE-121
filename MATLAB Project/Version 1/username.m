%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% username.m                                       %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%sets user name
function [ user_name ] = username()
%username Summary of this function goes here
%   ask what user name the person wants 
c=0;
 fprintf('This is where you enter the username you want to use.\n')
    
    fprintf('If you enter an invalid name, you will be prompted to enter a new name.\n')
while c==0

%the user choose the name they want as a user name   
potential_username=inputdlg('Enter the name of the name you want as your user name.','Username');
a=whos('potential_file_name');
potential_username=cell2mat(potential_username);
b=isempty(potential_username);

if b==0
    user_name=potential_username;
    c=1;
else
    %the user did not enter the wrong type or wrong name
    fprintf('%d is not valid username; please enter a string as the username.\n\n',potential_username)
end
clc
end

