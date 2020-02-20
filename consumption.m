function c = consumption(v)

load roadster

c = spline(speed_kmph, consumption_Whpkm, v);

end

