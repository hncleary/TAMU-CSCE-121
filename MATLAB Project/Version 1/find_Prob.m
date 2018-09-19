%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% finds probablity                                 %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find_prob.m
function [ message2 , probability ] = find_Prob( data_file, my_Mean, my_Stdev )
%Find the probability
data_file=data_file(:)
b=isnumeric(data_file);
message2=(' ')
%checks data
if b~=1 ;
    error('wrong type of data');
end
l=length(data_file);
b=sqrt(l);
b=abs(b);
b=round(b);
%makes sure the data is norm distribute
figure(1);
subplot(1,2,1)
c=histfit(data_file,b);
title('Histogram fit');
subplot (1,2,2)
d=normplot(data_file);
button = questdlg('In your judgment, is the data normally distributed?',...
    'Normally Distributed?','Yes','No','No');
close all
switch button
    %asks if they want a point or interval
    case 'Yes'
        choice = questdlg('What type of "X" do you want to enter', ...
            'Type of "X"','Point','Interval','Interval')
        switch choice
            %want a point or interval
            case 'Point'
                %for the point
                button2 = questdlg('Do you have X or Z? ',...
                    'Probability','X','Z','Z');
                switch button2
                    case 'X'
                        n=0;
                        m=0;
                        
                        while n==0
                            %ask for the point
                            x=inputdlg('Enter you "X" value.');
                            %x='a';
                            m=isempty(x);
                            if m==0
                                e=cell2mat(x);
                                f=str2num(e);
                                h=length(f);
                                if h== 1
                                    %finds the probablity
                                    probability=normpdf(f,my_Mean,my_Stdev);
                                    n=1;
                                    
                                else
                                    %checks for error
                                    errordlg...
                                        ('The value you entered for "X" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                    pause(5);
                                    n=0;
                                end
                            else
                                %checks for error
                                errordlg('The value you entered for "X" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                
                                pause(5);
                                n=0;
                                
                            end
                        end
                        
                        
                        
                    case 'Z'
                         n=0;
                        m=0;
                        
                        while n==0
                            
                            z=inputdlg('Enter you "Z" value.');
                            %asks you the Z value
                            m=isempty(z);
                            if m==0
                                e=cell2mat(z);
                                f=str2num(e);
                                h=length(f);
                                if h== 1
                                    %finds the probablity
                                    f=f*my_Stdev+my_Mean;
                                    probability=normpdf(f,my_Mean,my_Stdev);
                                    n=1;
                                    
                                else
                                    %checks for error
                                    errordlg('The value you entered for "Z" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                    pause(5);
                                    n=0;
                                end
                            else
                                %checks for error
                                errordlg('The value you entered for "Z" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                
                                pause(5);
                                n=0;
                                
                            end
                        end
                        
                        
                end
            case 'Interval'
                %gets the top and bottom of interval
                 button2 = questdlg('Do you have X or Z? ','Probability','X','Z','Z');
                switch button2
                    case 'X'
                        %finds the top and bottom points
                        n=0;
                        m=0;
                while n==0
                    %finds the prob
            x=inputdlg({'Enter the lower point' , 'Enter the upper point'}, 'Bounds');    
            m=isempty(x);
            x1=-99999999999999999;
            x2= 99999999999999999;
            x1=x(1);
            x2=x(2);
            
                if m==0
                    e=cell2mat(x1);
                    f=str2num(e);
                    h=length(f);
                    ee=cell2mat(x2);
                    ff=str2num(ee);
                    hh=length(ff);
                    hhh=ff-f;
                    
                    if h==1 && hh==1 && hhh>=0
                        %finds the probablity
                        probability=normcdf([f ff],my_Mean,my_Stdev);
                        probability=probability(2)-probability(1);
                        n=1;
                        
                    else
                        %checks for error
                        errordlg('The values you entered for "X" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                         pause(5);
                         n=0;
                     end
                else
                     %checks for error
                     errordlg('The value you entered for "X" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                
                     pause(5);
                     n=0;
               
                end 
                end
                    case 'Z'
                        %finds the z value
                        n=0;
                        m=0;
                        while n==0
                            %gets the upper and lower z values
                            z=inputdlg({'Enter the lower point' , 'Enter the upper point'}, 'Bounds');    
                            m=isempty(z);
                            x1=-99999999999999999;
                            x2= 99999999999999999;
                            z1=z(1);
                            z2=z(2);
                                if m==0
                                    %makes sure the data works
                                    e=cell2mat(z1);
                                    f=str2num(e);
                                    h=length(f);
                                    ee=cell2mat(z2);
                                    ff=str2num(ee);
                                    hh=length(ff);
                                    f=f*my_Stdev+my_Mean;
                                    ff=ff*my_Stdev+my_Mean;
                                    hhh=ff-f;
                                        if h==1 && hh==1 && hhh>=0
                                            %finds the probablity
                                            probability=normcdf([f ff],my_Mean,my_Stdev);
                                            probability=probability(2)-probability(1);
                                            n=1;
                                            
                                        else
                                            %checks for errors
                                            errordlg('The values you entered for "Z" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                            pause(5);
                                            n=0;
                                        end
                                else
                                    %checks for errors
                                    errordlg('The value you entered for "Z" is not valid or you did not enter a value. Please wait five seconds to continue. ','error');
                                
                                    pause(5);
                                    n=0;
                                    
                                    
                                end
                        end
                            
                            
                        
               end     
        end
                
                
            case 'No'
                %this happens if the data is not normally distibuted
                messege2='You can not preform z-table calculations because data is not normally distributed!';
                msgbox(messege2,'Messege')
                pause(3);
                probability = ''
        end



end

