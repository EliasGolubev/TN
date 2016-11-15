load './train.rb'
load './station.rb'
load './route.rb'
# create train passenger
#Create Station
 heineken = Station.new("Heineken")
 hoop = Station.new("Hoop")
 goot = Station.new("Goot")

#Route passenger train
 route_pas = Route.new(heineken, goot)
 route_pas.add(hoop.name)
#Route freight train
 route_fre = Route.new(hoop.name, goot.name)

 train1 = Train.new(PassengerType.new("T001x0", 10))
 train2 = Train.new(FreightType.new("T0029x0", 12))

 heineken.add_train(train1)
 hoop.add_train(train2)
 p heineken 
 p hoop 
 p goot 





