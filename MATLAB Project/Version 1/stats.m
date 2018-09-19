function [ my_Mean, my_Median, my_Mode, my_Var, my_Stdev, my_Min, my_Max, my_Count, message ] = stats( data_file )
%Stats
data_file=data_file(:);
my_Mean=mean(data_file);
my_Mean=round(my_Mean,2)
my_Median=median(data_file);
my_Median=round(my_Median,2)
my_Mode=mode(data_file);
my_Mode=round(my_Mode,2)
my_Var=var(data_file);
my_Var=round(my_Var,2)
my_Min=min(data_file);
my_Min=round(my_Min,2)
my_Max=max(data_file);
my_Max=round(my_Max,2)
my_Count=length(data_file);
my_Count=round(my_Count,6,'significant')

   for Q = 1:1:my_Count;
       w(Q)=((data_file(Q)-my_Mean)^2)';
    end
if my_Count>30
    E=sum(w);
    T=(1/my_Count);
    my_Stdev=sqrt(T*E);
    my_Stdev=round(my_Stdev,2);
    message='Because the count was greater than 30; the population standard deviation model was used.'; 
else
    E=sum(w);
    T=(1/(my_Count-1));
    my_Stdev=sqrt(T*E);
    my_Stdev=round(my_Stdev,2);
    message='Because the count was less than or equal to 30; the sample standard deviation model was used.';
end

    



end

