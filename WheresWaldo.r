library(raster)
waldo = stack("WaldoBeach.jpg")

r = waldo[[1]] - waldo[[2]] - waldo[[3]]
r[is.na(r)] = 0
r_mask = Which(r > 0)
r_masked = r * r_mask

focalsd = focal(r_masked, w=3, fun=sd)
plot(focalsd)