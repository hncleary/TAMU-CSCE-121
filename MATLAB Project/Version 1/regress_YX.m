%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% plots the regression                             %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%regress_YX
function [  ] = regress_YX( data_file )
%plots regression
n=0;
while n==0
%gets the size of the data files
s=size(data_file);
a=s(2);
if a ~=2 
    %tells the user the data does not work
    h = msgbox('The data set you loaded is not of correct size.', 'Error','error');
    regression='the regression could not be determined.'
    pause(3);
    n=1;
else
    %makes sure the data does work
    x=length(data_file(:,1));   
    y=length(data_file(:,2));
        if x ~= y
            %tells the user the data does not work
           h = msgbox('The data set you loaded is not of correct size.', 'Error','error');
           regression='the regression could not be determined.'
            pause(3);
            n=1;
        else
            %asks what column of data you want to be X and Y
            X=data_file(:,1);
            Y=data_file(:,2);
            b=questdlg('What is the first set of column of data?','Set X/Y','X','Y','Y');
            n=1;
            choice = b;
            switch choice
                case 'X'
                    X=data_file(:,1);
                    Y=data_file(:,2);
                case 'Y'
                    X=data_file(:,2);
                    Y=data_file(:,1);
            end
            i=0;
            while i == 0
                %asks the user what kind of regression they want 
                str= {'Linear' , 'Quadratic','Cubic','4th degree polynomial','5th degree polynomial','6th degree polynomial','7th degree polynomial','8th degree polynomial','9th degree polynomial'};
                power_of_regression=listdlg('PromptString','What degree of regression would you like?','name','Degree selection', 'SelectionMode','single','ListString',str);
                empty=isempty((power_of_regression));
                if empty == 0
                    choice = power_of_regression(1) ;
                    i=1;
                end
            end
        end
            g=polyfit(X,Y,choice)
            switch choice
                %finds the equation of the line
                case 1
                    h=g(1)*X + g(2);
                    t = 'Linear';
                case 2
                    h=g(1)*(X).^2 +g(2)*(X) + g(3);
                    t = 'Quadratic';
                case 3
                    h=g(1)*(X).^3 + g(2)*(X).^2 + g(3)*(X) + g(4);
                    t = 'Cubic';
                case 4
                    h=g(1)*(X).^4 + g(2)*(X).^3 + g(3)*(X).^2 + g(4)*X.^1 + g(5)*X.^0;
                    t = '4th degree polynomial';
                case 5
                    h=g(1)*(X).^5 + g(2)*(X).^4 + g(3)*(X).^3 + g(4)*X.^2 + g(5)*X.^1 + g(6)*X.^0;
                    t = '5th degree polynomial';
                case 6
                    h=g(1)*(X).^6 + g(2)*(X).^5 + g(3)*(X).^4 + g(4)*X.^3 + g(5)*X.^2 + g(6)*X.^1 + g(7)*X.^0;
                    t = '6th degree polynomial';
                case 7
                    h=g(1)*(X).^7 + g(2)*(X).^6 + g(3)*(X).^5 + g(4)*X.^4 + g(5)*X.^3 + g(6)*X.^2 + g(7)*X.^1 + g(8)*X.^0;
                    t = '7th degree polynomial';
                case 8
                    h=g(1)*(X).^8 + g(2)*(X).^7 + g(3)*(X).^6 + g(4)*X.^5 + g(5)*X.^4 + g(6)*X.^3 + g(7)*X.^2 + g(8)*X.^1 + g(9)*X.^0;
                    t = '8th degree polynomial';
                case 9
                    h=g(1)*(X).^9 + g(2)*(X).^8 + g(3)*(X).^7 + g(4)*X.^6 + g(5)*X.^5 + g(6)*X.^4 + g(7)*X.^3 + g(8)*X.^2 + g(9)*X.^1 + g(10)*X.^0;
                    t = '9th degree polynomial';
            end
            %plots the graph 
            figure;
            A=plot(X,Y,'*',X,h,'--')
            hold on
            legend('Data Set', 'Regression fit')
            xlabel('X');
            ylabel('Y');
            title(t);
            hold off
            c=0;
            
    
    while c==0;

%gets the name of the file to save   
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


    v=0;
    while v==0;
str={'1) JPEG 24-bit','2) PNG 24-bit','3) TIFF 24-bit (compressed)','4) Enhanced metafile (Windows only)','5) BMP Monochrome','6) HDF 24-bit','7) PBM (plain format) 1-bit','8) PCX 24-bit color (three 8-bit planes)','9) PGM (plain format)','10) PPM (plain format)','11) MATLAB® FIG-file (invalid for Simulink block diagrams)','12) MATLAB FIG-file and MATLAB code that opens figure (invalid for Simulink block diagrams)','13) Full page Portable Document Format (PDF) color','14) Encapsulated PostScript® (EPS) Level 3 black and white','15) SVG (scalable vector graphics)','16) Full-page PostScript (PS) Level 3 black and white'};
    choice=listdlg('PromptString','Select a file type.','Name','Choose a file type.','SelectionMode','single','liststring',str)
    empty=isempty(choice);
    %choose what kind of data to save the plot as
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
%saves the plot
name=[file_name T];
saveas(gcf,name);
v=1;
close all
clc

catch
    %checks for errors
  errordlg('There was an error in saving your figure, please try again.')
   v=0;
end
   
   end
end
end
    end


end

