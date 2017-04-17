%计算个体的适应值
%Name:calfitvalue.m

function [fitvalue,poptemp]=calfitvalue(pop)
global price;
global weight;
[px,py]=size(pop);

%计算目标函数值
for i=1:px
    objvalue(i)=pop(i,:)*price;
    convalue(i)=pop(i,:)*weight;
end

%计算种群适应度值
for i=1:px
        if convalue(i)<=60                   
                temp=objvalue(i);          
        else
                temp=0;
        end
        fitvalue(i)=temp;
end

%用最优个体替代不符合约束条件的个体
[maxfit,mn]=max(fitvalue);
for i=1:px
    if convalue(i)>60
            poptemp(i,:)=pop(mn,:);
            fitvalue(i)=maxfit;
    else
            poptemp(i,:)=pop(i,:);            
    end
end

fitvalue=fitvalue';
