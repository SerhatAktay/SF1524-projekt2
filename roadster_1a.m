
%Projekt 2 Uppgift 1a

clear all, clf, clc

load roadster.mat

v = 60; % ange hastigheten som du kör med

c = consumption(v); % anropa funktionen consumption med värdet v

s = spline(speed_kmph,consumption_Whpkm,speed_kmph); % styckvis polynom

distance = 55000 / c;   % beräknar hur långt du kan köra vid given v
distance_left = 55000 ./ consumption(speed_kmph); % distans vid alla möjliga hastigheter

[max_range,ind] = max(distance_left)   % tar fram maximala körsträcka
speed_max_range = speed_kmph(ind);      % tar fram hastighet vid max körsträcka

subplot(2,1,1)
hold on
plot(speed_kmph, consumption_Whpkm, 'rx','MarkerSize',3)
plot(speed_kmph, s, 'k')
plot(v, c, 'bx','MarkerSize',8,'LineWidth', 2)
xlabel('Speed (km/h)')
ylabel('Consumption (Wh/km)')
legend('function','spline', 'given speed')
title('Consumption (Wh/km) as a function of speed (km/h)')
grid on

subplot(2,1,2)
hold on
plot(speed_kmph,distance_left, 'r')
plot(speed_max_range, max_range, 'g*','MarkerSize',5,'LineWidth', 2)
plot(v, distance, 'bx','MarkerSize',8,'LineWidth', 2)
xlabel('Speed (km/h)')
ylabel('Range at given speed (km)')
legend('function','maximum range', 'range at given speed')
title('Range of car (km) as a function of speed (km/h)')
grid on

fprintf('Om du kör med hastigheten %1.2f km/h konsumerar bilen %1.3f Wh och du kan köra %1.2f km',v,c,distance)


