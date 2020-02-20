function T = time_to_destination_simpson(x,route,n)

load(route)

h = x/n; % steglängden
intervall = (0:h:x); % tar fram n lika stora intervall mellan 0 och x

a = 1./velocity(intervall(1:end), route); % alla element
b = 1./velocity(intervall(1), route); % första elementet
c = 1./velocity(intervall(end), route); % sista elementet
d = 1./velocity(intervall(2:2:end-1), route); % vartannat element från andra till näst sista

area = (h/3) * (2*sum(a) - b - c + 2*sum(d)); % beräkna area enligt Simpsons metod
T = 60 * area;    % omvandla arean i timmar till minuter

%fprintf('Det tar %1.4f minuter att åka %1.2f km enligt Simpsons regel med %i intervall \n\n', tid, x, n)

end
    