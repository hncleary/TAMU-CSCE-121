%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% my_Histfit.m                                     %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%my_Histfit.m
function [] = my_Histfit( data_file )
%
%plots hist fit
figure;
%checks the data file and puts it in one column
data_file=data_file(:);
    b=isnumeric(data_file);
       if b~=1 ;
        error('wrong type of data');
       end
       %gets number of bins
    l=length(data_file);
    b=sqrt(l);
    b=abs(b)
    b=round(b);
    %plots the hist fit
    d=histfit(data_file,b);
    title('Histogram fit');
    c=0;
    %gets the name you want to save the plot as
    fprintf('This is where you enter the name of the file you want the histfit to be saved in.\n')
    
    fprintf('If you enter an invalid name, you will be prompted to enter a new name.\n')
while c==0;
try
   
potential_filename=inputdlg('What would you like to name your output file.','File name');
potential_filename=cell2mat(potential_filename);
a=whos('potential_filename');
b=isa(potential_filename,'char');

%saves the plot                
                
if b==1
    file_name=potential_filename;
    c=1;
else
    fprintf('%d is not valid username; please enter a string as the file name.\n\n',potential_filename)
end

catch

end
end

		 
 
  
savefig(file_name)
clc

close all;
end

