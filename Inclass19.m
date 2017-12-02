%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 80 No comments to address the question asked. 
Overall 95


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

m=[mean(placebo),mean(treatment1),mean(treatment2)];
stdev=[std(placebo),std(treatment1),std(treatment2)];
figure(1);
bar(m);
hold on;
errorbar(m,stdev,'.');
hold off;

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

data=[placebo',treatment1',treatment2'];
labels={'placebo','treatment1','treatment2'};
figure(2);
[p,table,stats]=anova1(data,labels);

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

figure(3);
multcompare(stats);

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

d=load('data.mat');

figure(4);
plot(d.xdat, d.ydat,'r.','MarkerSize',24);
[coeff21,s1]=polyfit(d.xdat,d.ydat,1);
hold on;
plot(d.xdat,polyval(coeff21,d.xdat),'k-','LineWidth',3);
hold off;

figure(5);
plot(d.xdat,d.ydat,'r.','MarkerSize',24);
[coeff22,s2] = polyfit(d.xdat,d.ydat,2);
hold on;
plot(d.xdat,polyval(coeff22,d.xdat),'k-','LineWidth',3);
hold off;

figure(6);
plot(d.xdat,d.ydat,'r.','MarkerSize',24);
[coeff23,s3] = polyfit(d.xdat,d.ydat,3);
hold on;
plot(d.xdat,polyval(coeff23,d.xdat),'k-','LineWidth',3);
hold off;

figure(7);
plot(d.xdat, d.ydat,'r.','MarkerSize',24);
[coeff21,s1]=polyfit(d.xdat,d.ydat2,1);
hold on;
plot(d.xdat,polyval(coeff21,d.xdat),'k-','LineWidth',3);
hold off;

figure(8);
plot(d.xdat,d.ydat,'r.','MarkerSize',24);
[coeff22,s2] = polyfit(d.xdat,d.ydat2,2);
hold on;
plot(d.xdat,polyval(coeff22,d.xdat),'k-','LineWidth',3);
hold off;

figure(9);
plot(d.xdat,d.ydat,'r.','MarkerSize',24);
[coeff23,s3] = polyfit(d.xdat,d.ydat2,3);
hold on;
plot(d.xdat,polyval(coeff23,d.xdat),'k-','LineWidth',3);
hold off;

%%
dfit={d.xdat;d.ydat2};

fit_out=fit(d.xdat(:),d.ydat2(:),'poly1');
figure(10);
plot(fit_out,d.xdat,d.ydat2)

fit_out=fit(d.xdat(:),d.ydat2(:), 'poly2');
figure(11);
plot(fit_out,d.xdat,d.ydat2)

fit_out=fit(d.xdat(:),d.ydat2(:), 'poly3');
figure(12);
plot(fit_out,d.xdat,d.ydat2)
