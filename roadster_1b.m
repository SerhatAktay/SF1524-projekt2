

%Projekt 2 Uppgift 1b

clear all,  clc, clf

%{
a_val = input('Vem är det som kör? \n \n 1 - Anna \n\n 2 - Elsa \n\n');
clc

if a_val ==1
    route = ('speed_anna.mat');
    load speed_anna.mat
else
    route = ('speed_elsa.mat');
    load speed_elsa.mat
end

x = input('Hur många km har du kört? (0-62)? ');
clc

%}

%load speed_anna.mat
load speed_elsa.mat

%route = ('speed_anna.mat');
route = ('speed_elsa.mat');

x = 40; % ange antal km du kört

velocity(x, route);    % funktion för att beräkna hastighet vid given distans

s = spline(distance_km, speed_kmph, distance_km); % styckvis polynom

% Plot över funktionen och interpolationen

hold on
plot(distance_km, speed_kmph, 'rx','MarkerSize',3)
plot(distance_km, s, 'k')
plot(x,ans,'bx','MarkerSize',8, 'LineWidth', 2)

xlabel('Distance driven (km)')
ylabel('Speed (km/h)')
title('Driving speed as a function of distance driven')
legend('function','spline')
grid on

fprintf('Om du har kört %1.2f km kör du just nu med %1.2f km/h',x,ans)