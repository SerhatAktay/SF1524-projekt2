function v = velocity(x,route) 

load(route)

v = spline(distance_km, speed_kmph, x);

end
