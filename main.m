clear
clc
popsize=50;                             	
%种群大小
chromlength=10;                     		
%字符串长度(个体长度)
pc=0.6;                                    	
%交叉概率，只有在随机数小于pc时，才会产生交叉
pm=0.001;                               	
%变异概率
global weight;
weight=[15 18 17 9 7 11 6 8 2 4]';
%物品重量
global price;
price=[11 12 9 8 12 14 8 12 7 8]';
%物品价格
pop=initpop(popsize,chromlength);	
%随机产生初始群体
for i=1:20                                                           	
%50为遗传代数
		
        [fitvalue,poptemp1]=calfitvalue(pop);
        %计算种群中个体目标函数值和适应度值
		
        [newpop]=selection(poptemp1,fitvalue);
		%复制    
        [newpop1]=crossover(newpop,pc); 
		%交叉
        [newpop2]=mutation(newpop1,pc);
		%变异   

        [fitvalue,poptemp2]=calfitvalue(newpop2);              
		%计算种群中个体目标函数值和适应度值 

        [bestindividual,bestfit]=best(poptemp2,fitvalue);
		%求出群体中适应度值最大的个体及其适应度值
        
        fitvaluemean=mean(fitvalue);
        y1=fitvaluemean;
        y2=bestfit;
 
        plot(i,y1,'r*',i,y2,'g*');
        hold on
        title('01背包问题遗传算法求解');
        xlabel('进化代数');
        ylabel('目标值');
        legend('平均适应度','最大适应度','location','best');
        pop=poptemp2;
        %更新种群
end

[z,index]=max(fitvalue);
bestprice=z
bestscheme=bestindividual


