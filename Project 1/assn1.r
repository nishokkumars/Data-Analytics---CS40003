library("psych")
df <- read.csv("CARS.csv")
# Print out `df`
speed <- df[["speed"]]
distance <- df[["dist"]]
ams <- mean(speed)
gms <- geometric.mean(speed)
hms <- harmonic.mean(speed)
print(c("Arithmetic mean speed",ams))
print(c("Geometric mean speed",gms))
print(c("Harmonic mean speed",hms))
amd <- mean(distance)
gmd <- geometric.mean(distance)
hmd <- harmonic.mean(distance)
print(c("Arithmetic mean distance",amd))
print(c("Geometric mean distance",gmd))
print(c("Harmonic mean distance",hmd))
