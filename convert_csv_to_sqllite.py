import pandas as pd
from sqlalchemy import create_engine # database connection
import datetime as dt

# create disk engine
disk_engine = create_engine('sqlite:///311_first_few.db')

chunksize=20000
j = 0
index_start = 1

start = dt.datetime.now()
for df in pd.read_csv('311_first_few.csv', chunksize=chunksize, iterator=True, encoding='utf-8'):
    
    df = df.rename(columns={c: c.replace(' ', '') for c in df.columns}) # Remove spaces from columns

    df['CreatedDate'] = pd.to_datetime(df['CreatedDate']) # Convert to datetimes
    df['ClosedDate'] = pd.to_datetime(df['ClosedDate'])

    df.index += index_start

    # select columns of interest
    columns = ['Agency', 'CreatedDate', 'ClosedDate', 'ComplaintType', 'Descriptor',
               'CreatedDate', 'ClosedDate', 'TimeToCompletion',
               'City']

    for c in df.columns:
        if c not in columns:
            df = df.drop(c, axis=1)    

    
    j+=1
    print '{} seconds: completed {} rows'.format((dt.datetime.now() - start).seconds, j*chunksize)

    df.to_sql('data', disk_engine, if_exists='append')
    index_start = df.index[-1] + 1

#3935 seconds: completed 10540000 rows