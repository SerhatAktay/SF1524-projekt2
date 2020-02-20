%Projekt 2 Uppgift 2c

clear all, clf, clc

x = 40; % ange antal km du kört
Area = []; % skapa en tom vektor 'Area'
Intervall = []; % skapa en tom vektor 'Intervall'

route = 'speed_anna.mat';
%route = 'speed_elsa.mat'

 for i = 1:10   % starta en for-loop
     n = 2.^i; % beräknar antal intervall för integralen
     Intervall = [Intervall n]; % sparar antalet intervall i vektorn 'Intervall'
     h = x/n;   % steglängden
     intervall = (0:h:x); % tar fram n lika stora intervall mellan 0 och x
     
     a = 1./velocity(intervall(1:end), route); % alla element
     b = 1./velocity(intervall(1), route); % första elementet
     c = 1./velocity(intervall(end), route); % sista elementet
     
     area = h * (sum(a)-0.5*(b+c)); % beräkna area enligt trapetsmetoden
     Area = [Area area]; % sparar värdet på arean i vektorn 'Area'
 end
 
 error = abs(diff(Area)); % beräknar absolutbeloppet av felet i integralberäkningen
 Intervall = Intervall(2:end); % tar bort första värdet från vektorn intervall
 
 y=1./(Intervall); % gör en rät linje att jämföra felen mot enligt 1/n^2
 x=2:10;
 Intervall2 = 3.^x;
 y_2 = 1./(Intervall2); % gör en rät linje att jämföra felen mot enligt 1/n^3
 Intervall3 = 4.^x;
 y_3 = 1./(Intervall3); % gör en rät linje att jämföra felen mot enligt 1/n^4
 
 % Plot
 loglog(error, Intervall, '-', 'linewidth', 1)
 hold on
 loglog(y, Intervall, '--', 'linewidth', 1)
 hold on
 loglog(y_2, Intervall, ':k', 'linewidth', 1)
 hold on
 loglog(y_3, Intervall, '-.', 'linewidth', 1)
 xlabel('Error')
 ylabel('Number of intervals')
 title('Plot of error in integration')
 legend('error','helpline (1/n^2)', 'helpline (1/n^3)', 'helpline (1/n^4)')
 grid on

 