# -*- coding: utf-8 -*-
import pickle
import pandas as pd

with open(r'C:\Users\0811m\Desktop\DScover\메인프로젝트\getStationByRoute.pickle', 'rb') as file:
    getStationByRoute = pickle.load(file)
    
num_psngr = pd.read_csv(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\노선별_총승객수.csv")
num_psngr["승하차총승객수"] = num_psngr["승차수"] + num_psngr["하차수"]
num_psngr.rename(columns = {"정류장순번":"seq"}, inplace = True)
num_psngr['노선명'] = num_psngr['노선명'].astype(str)
num_psngr.to_csv(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\노선별_총승객수_합.csv", index = False)

sub_dist = pd.read_csv(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\지하철역까지거리.csv")
sub_dist['arsId'] = sub_dist['arsId'].astype(str)

#%%
num_psngr = pd.read_csv(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\노선별_총승객수_합.csv")

#%% 정류장 kmeans용 데이터 병합

def StationByRoute(bus):
    with open(r'C:\Users\0811m\Desktop\DScover\메인프로젝트\getStationByRoute.pickle', 'rb') as file:
        getStationByRoute = pickle.load(file)
    bus_cnt = pd.read_csv(fr"C:\Users\0811m\Desktop\DScover\메인프로젝트\bus_{bus}_route_counts.csv")
    num_psngr = pd.read_csv(r"C:\Users\0811m\Desktop\DScover\메인프로젝트\노선별_총승객수_합.csv")

    df1 = getStationByRoute.get(bus)
    df1 = df1[['arsId', 'seq']]
    
    num_psngr = num_psngr[num_psngr['노선명'] == int(bus)]
    num_psngr = num_psngr[['seq', "승하차총승객수"]]
    
    df1['arsId'] = df1['arsId'].fillna(0).astype(int)
    df1['arsId'] = df1['arsId'].astype(str)
    df1['arsId'] = df1['arsId'].str.strip()
    
    bus_cnt['arsId'] = bus_cnt['arsId'].fillna(0).astype(int)
    bus_cnt['arsId'] = bus_cnt['arsId'].astype(str)
    bus_cnt['arsId'] = bus_cnt['arsId'].str.strip()
    
    num_psngr['seq'] = num_psngr['seq'].astype(int)
    df1['seq'] = df1['seq'].astype(int)
    
    df1 = pd.merge(df1, sub_dist, on='arsId', how='left')
    df1 = pd.merge(df1, bus_cnt, on='arsId', how='left')
    df1 = pd.merge(df1, num_psngr, on='seq', how='left')
    
    df1.drop('Unnamed: 0', axis =1, inplace =True)
    
    return df1


# station_171 = StationByRoute('171')
# station_172 = StationByRoute('172')
# station_100 = StationByRoute('100')
# station_140 = StationByRoute('140')
# station_143 = StationByRoute('143')
# station_150 = StationByRoute('150')
# station_151 = StationByRoute('151')
# station_160 = StationByRoute('160')
# station_162 = StationByRoute('162')

#%%
# 노선명 리스트
bus_lines = ['171', '172', '100', '140', '143', '150', '151', '160', '162']

# 결과를 저장할 딕셔너리 초기화
bus_data_dict = {}

# 각 노선에 대해 StationByRoute 함수를 호출하고, 결과를 딕셔너리에 저장
for bus in bus_lines:
    bus_data_dict[bus] = StationByRoute(bus)

with open(r'C:\Users\0811m\Desktop\DScover\메인프로젝트\노선별_정류장Kmeans정리.pickle', 'wb') as fw:
    pickle.dump(bus_data_dict, fw)
    
    #%%
import pandas as pd
print(pd.__version__)
print(pd.__file__)

#%%
!pip install --upgrade pandas

