close all
pause(0.1);

vars = who;
for i = 1:length(vars)
    eval(['clear ' vars{i}]);
end
clear i; clear vars;

clc

pause(0.1);