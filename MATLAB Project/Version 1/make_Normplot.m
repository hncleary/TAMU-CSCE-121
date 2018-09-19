%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% make_Normplot.m                                  %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%makes norm plot
function [] = make_Normplot( data_file )
%plots normplot
figure;
%loads data
data_file=data_file(:);
    b=isnumeric(data_file);
       if b~=1 ;
        error('wrong type of data');
       end
      %plots the normal distributed scater plot 
    d=normplot(data_file);
    c=0;
    fprintf('This is where you enter the name of the file you want the normplot to be saved in.\n')
    
    fprintf('If you enter an invalid name, you will be prompted to enter a new name.\n')
while c==0;
try
 %name of the output file  
potential_filename=inputdlg('What would you like to name your output file.','File name');
potential_filename=cell2mat(potential_filename);
a=whos('potential_filename');
b=isa(potential_filename,'char');

                
                
if b==1
    file_name=potential_filename;
    c=1;
else
    fprintf('%d is not valid username; please enter a string as the file name.\n\n',potential_filename)
end

catch

end
end

		 
 
%save the norm scater plot
savefig(file_name)
clc
close all;
end





