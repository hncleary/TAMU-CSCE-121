%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 112  Sections 512                           %
% Harland Ashby                                    %            
% Ahmad Al Kawam                                   %
% 04/30/16                                         %
% Week 19                                          %
% my_Point.m                                       %
% Ver. 1.0                                         %
%                                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%find point
function [ point , leter_choose ] = my_Point( data_file , my_Mean , my_Stdev )
%finds the point given probablity.
data_file=data_file(:);
l=length(data_file);
b=sqrt(l);
b=abs(b);
b=round(b);
%checks to see if the data is normally distributed
figure(1);
subplot(1,2,1)
c=histfit(data_file,b);
title('Histogram fit');
subplot (1,2,2)
d=normplot(data_file);
button = questdlg('In your judgment, is the data normally distributed?','Normally Distributed?','Yes','No','No');
close all
switch button
    case 'Yes'
choice=questdlg('Do you want an interval or point?','Type','Point','Interval','Interval');
i=0;
switch choice
    %asked the user if they want a point or interval.
    case 'Point'
        %finds the point
        while i==0;
            try
            p=inputdlg('Enter your probablity on decimal form. Ex: 30% would be enetered as.3 .','Enter probability');
            p=cell2mat(p);
            p=str2num(p);
            e=isempty(p);
            %makes sure the probablity you enter is valid.
            if e==1 || p > 1 || p <= 0 ;
                errordlg('The value you entered for probablity is not valid, please try again.')
                pause(2);
                close all;
            else
                %do they want a X or a Z
                choice2=questdlg('Do you want X or Z ?','Type','X','Z','Z');
                switch choice2
                    case 'X'
                        %finds the point
                        leter_choose = choice2;
                        point=norminv(p,my_Mean,my_Stdev);
                        i=1;
                    case 'Z'
                        %finds the Z value
                        leter_choose = choice2;
                        point=norminv(p,my_Mean,my_Stdev);
                        point=(point- my_Mean)/my_Stdev;
                        i=1;
                end
                
            end
            catch
                i=0;
        end
        end
        
            case 'Interval'
                %finds the interval
                while i==0;
                    %makes sure to prob is valid
                try
                p=inputdlg('Enter your probablity on decimal form. Ex: 30% would be enetered as.3 .','Enter probability');
                p=cell2mat(p);
                p=str2num(p);
                e=isempty(p);
                    if e==1 || p > 1 || p <= 0 ; ;
                        %makes sure the prob is valid
                        errordlg('The value you entered for probablity is not valid, please try again.')
                        pause(2);
                        close all;
                    else
                        %finds the top and bottom probality
                        p=1-p;
                        p=p/2;
                        pUp=1-p;
                        pLow=p;
                        choice2=questdlg('Do you want X or Z?','Type','X','Z','Z');
                switch choice2
                    case 'X'
                        %finds the upper and lower points
                        leter_choose = choice2;
                        pointUp=norminv(pUp,my_Mean,my_Stdev);
                        pointLow=norminv(pLow,my_Mean,my_Stdev);
                        point = [pointLow pointUp];
                        i=1;
                    case 'Z'
                        %finds the upper and lower z values
                        leter_choose = choice2;
                        pointUp=norminv(pUp,my_Mean,my_Stdev);
                        pointLow=norminv(pLow,my_Mean,my_Stdev);
                        pointUp=(pointUp- my_Mean)/my_Stdev;
                        pointLow=(pointLow- my_Mean)/my_Stdev;
                        point=[pointLow pointUp];
                        i=1;
                end
                        
                
                
                    end
                catch 
                    i==0;
                end
                end
end
    case 'No'
        %this is what it does is the data is not norm distibuted
        messege2='You can not preform z-table calculations because data is not normally distributed!';
                msgbox(messege2,'Messege')
                pause(3);
                point = ''
                leter_choose = ''
end
close all 
 
clc

end

