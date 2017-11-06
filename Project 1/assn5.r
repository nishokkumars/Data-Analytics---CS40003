library("graphics")
library("openxlsx")
df <- read.xlsx("WEATHER.xlsx")
#print(df)
print("Data cube formed")
split(df,df[["Station.Name"]])  #now df becomes a data cube
#classifying all 90 towns/cities on basis of region as north,south,east,west takes
#long time, so what I have done is on a random basis, made 4 regions
#regions 1,2,3,4 which will be used for roll up/drill down operation
region1 <- c("Abu"
,"Agartala (A)"
,"Agra"
,"Ahmedabad"
,"Aijal/Aizwal"
,"Ajmer"
,"Akola (A)"
,"Allahabad"
,"Ambikapur"
,"Amini Divi"
,"Amritsar (Rajasansi)"
,"Anantpur"
,"Androth"
,"Aurangabad")
region2 <- c("Balasore"
,"Bangalore"
,"Bareilly"
,"Baroda (A)"
,"Belgaum Samra"
,"Bhagalpur"
,"Bhatinda"
,"Bhopal (Bairagarh)"
,"Bhubaneshwar (A)"
,"Bhuj (Rudramata)"
,"Bikaner"
,"Cannanore"
,"Chandigarh"
,"Chennai (Minambakkam)"
,"Cherrapunji"
,"Coimbatore (Pilamedu)"
,"Cooch Behar"
,"Darjeeling"
,"Dehra Dun"
,"Dharmsala"
,"Dibrugarh/Mohanbari"
,"Minicoy"
,"Mukteswar (Kumaun)"
,"Mumbai (Santa Cruz)"
,"Mysore"
,"Nagpur (Sonegaon)"
,"Nainital"
,"Nasik"
,"New Delhi (Palam)")
region3 <- c("New Delhi (SFD)","Palakkad (Palghat)","Panjim","Parbhani","Pasighat","Patna (A)","Pondicherry (A)","Port Blair","Pune","Raipur","Rajkot (A)","Ranchi (A)","Sambalpur","Shillong","Shimla","Silchar","Solapur","Sri Niketan","Srinagar","Surat","Thiruvananthapuram","Tirupathy","Tura","Udaipur (Dabok)","Uthagamandalam","Varanasi (Babatpur)","Vijayawada","Vishakhapatnam")
region4 <- c("Gadag"
,"Gangtok"
,"Gaya"
,"Gopalpur"
,"Gorakhpur"
,"Gulbarga"
,"Guwahati (Bhorjar)"
,"Gwalior"
,"Hassan"
,"Hissar"
,"Hyderabad (A)"
,"Imphal/Tulihal"
,"Indore"
,"Jabalpur"
,"Jagdalpur"
,"Jaipur (Sanganer)"
,"Jaisalmer"
,"Jammu"
,"Jamshedpur"
,"Jharsuguda"
,"Jodhpur"
,"Joshimath"
,"Jullundur"
,"Kanpur (A)"
,"Kanyakumari"
,"Karnal"
,"Khajuraho"
,"Kodaikanal"
,"Kohima"
,"Kolkata (Alipur)"
,"Kota (A)"
,"Kozhikode (A)"
,"Lucknow (Amausi)"
,"Ludhiana"
,"Madurai (A)"
,"Mahabaleshwar"
,"Malda"
,"Manali"
,"Mangalore (Bajpe)"
,"Masulipatnam")
#slice operation - only mean-rainfall,month and town
keeps <- c("Station.Name", "Month","Mean.Rainfall.in")
slice1 <- df[keeps]
print("Example of slice operation on data cube")
print(slice1)
#dice operation - only min.mean.temperature,month and town,towns starting only with b
keeps1 <- c("Station.Name","Month","Maximum.mean.temperature")
dice1 <- df[keeps1]
print(colnames(dice1))
dice1 <- subset(dice1,Station.Name %in% region1)
print("Example of dice operation on data cube")
print(dice1)
#roll up operation
print("Example of roll up operation on data cube")
split(df,df[["Station.Name"]] %in% region4)
#since lower level database is given, I don't understand how to implement drill down operation
