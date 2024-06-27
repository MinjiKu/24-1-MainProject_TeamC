import pickle

with open(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\getRouteByStation.pickle", 'rb') as file:
    getRouteByStation = pickle.load(file)
    
with open(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\getStationByRoute.pickle", 'rb') as file:
    getStationByRoute = pickle.load(file)
    
def route_arsid(bus_no):
    temp = getStationByRoute.get(bus_no)
    temp = temp['arsId']
    temp.tolist()
    temp.to_csv(fr"C:\Users\0811m\Desktop\DScover\메인프로젝트\0627_arsId_{bus_no}.csv")
    
route_arsid("143")
route_arsid("172")
route_arsid("171")
route_arsid("162")
route_arsid("160")
route_arsid("151")
route_arsid("150")
route_arsid("140")
route_arsid("100")