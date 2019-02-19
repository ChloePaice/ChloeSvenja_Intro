%% small exercise loops
i = 0;
%A = []; %size not predefined
A = zeros(1,4); %--> size predefined
for j=1:4
    i=i+j;
    A(j)=i; %or A=[A,i] also possible for non-predefined;
end
disp(A)

%% wild boar for loop
N = 50E3;
r = 0.48;
dt = 1;
B = [];
for t=1:10
    N = N*(1+r*dt);
    %B=[B,N] far too slow NEVER use this!
    B(t)=N %is much faster! But constantly overwriting same array
    % Best is always to PREALOCATE
end
figure
plot(B)
hold on
N1 = PopAtMoment(t_row,0.48,N0);
plot (t_row, N1, 'color', 'r')

%% wild boar while loop
N_while = 50E3;
C = zeros(1,10);
t = 1;
while t<11
    N_while = N_while*(1+r*dt);
    C(t)= N_while
    t = t+1;
end
figure
plot(C)

%% nested loops - CalculateSlope
clearvars
load('dem.mat');
MiniMatrix = ExtractMyDem(dem,30,90,15,60);
Slope1 = Slope(MiniMatrix,90,'nested');
Slope2 = Slope(MiniMatrix,90,'indexed');


