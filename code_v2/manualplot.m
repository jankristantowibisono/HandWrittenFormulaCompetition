clear all;
close all;
clc;

vsvm = [24 22 15 8 2];
vsvm = vsvm /.30;
csvm = [25 22 12 8 1];
csvm = csvm /.30;
nn = [22 18 8 7 1];
nn = nn /.30;
x = 1:5;
figure
plot(x,vsvm,x,csvm,x,nn)
legend('V-SVM','C-SVM','NN')
xlabel('Level');
ylabel('Accuracy (%)');
title({['Number of true VS Level']});
saveas(gcf,['Accuracy(%) VS Level.png']);