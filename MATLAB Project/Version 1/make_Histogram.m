%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% make_Histogram.m                                 %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%make_Histogram
function [] = make_Histogram( data_file )
%makes and exports a histagram to the file of your choosing 
figure;
%loads data
data_file=data_file(:);
    b=isnumeric(data_file);
       if b~=1 ;
        error('wrong type of data');
       end
       %plot the histogram 
    d=histogram(data_file,'BinMethod','sqrt');
    title('Histogram');
    c=0;
    fprintf('This is where you enter the name of the file you want the histogram to be saved in.\n')
    
    fprintf('If you enter an invalid name, you will be prompted to enter a new name.\n')
while c==0;
try
%name of the file you want to save the plot as  
potential_filename=inputdlg('What would you like to name your output files.','File name.');
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
v=0;

while v == 0;
 %decide what type of file to save the graph as.
   
    str={'1) JPEG 24-bit','2) PNG 24-bit','3) TIFF 24-bit (compressed)','4) Enhanced metafile (Windows only)','5) BMP Monochrome','6) HDF 24-bit','7) PBM (plain format) 1-bit','8) PCX 24-bit color (three 8-bit planes)','9) PGM (plain format)','10) PPM (plain format)','11) MATLAB® FIG-file (invalid for Simulink block diagrams)','12) MATLAB FIG-file and MATLAB code that opens figure (invalid for Simulink block diagrams)','13) Full page Portable Document Format (PDF) color','14) Encapsulated PostScript® (EPS) Level 3 black and white','15) SVG (scalable vector graphics)','16) Full-page PostScript (PS) Level 3 black and white'};
    choice=listdlg('PromptString','Select a file type.','Name','Choose a file type.','SelectionMode','single','liststring',str)
    empty=isempty(choice);


    




if empty == 0
                 switch choice;
                        case 1;
                             % do action for option 1
                            T='.jpg';
                            v=1;
                        case 2;
                             % do action for option 2
                            T= '.png';
                            v=1;
                        case 3;
                             % do action for option 3
                             T='.tif' ;
                             v=1;
                        case 4;
                             % do action for option 4
                            T='.emf' ;
                            v=1;
                        case 5;
                             % do action for option 5
                            T='.bmp' ;
                            v=1;
                        case 6;
                             % do action for option 6
                            T= '.hdf';
                            v=1;
                        case 7;
                             % do action for option 7
                            T= '.pbm';
                            v=1;
                        case 8;
                            % do action for option 8
                            T= '.pcx';
                            v=1;
                        case 9;
                            % do action for option 9
                            T='.pgm' ;
                            v=1;
                        case 10;
                            % do action for option 10
                            T= '.ppm';
                            v=1;
                        case 11;
                            % do action for option 11
                            T= '.fig' ;
                            v=1;
                        case 12
                            % do action for option 12
                            T='.m' ;
                            v=1;
                        case 13
                            % do action for option 13
                            T='.pdf';
                            v=1;
                        case 14
                            % do action for option 14
                            T= '.eps';
                            v=1;
                        case 15
                            % do action for option 15
                            T='.svg' ;
                            v=1;
                        case 16
                            % do action for option 16
                            T='.ps' ;
                            v=1;
                     otherwise
                         fprintf('please choose an option') 
                         v=0;
                         end
else
                     fprintf('please choose a file type.\n')
                     v=0;
         
         end

 try
 %save the plot
name=[file_name T];

saveas(d,name);
clc
close all;
 catch
 fprintf('The file type you selected is not a valid one due to not having the correct libary loaded. \n');
     v=0;

 end
 end
end

