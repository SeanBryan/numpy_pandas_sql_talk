#https://plot.ly/python/big-data-analytics-with-pandas-and-sqlite/

import pandas as pd
from sqlalchemy import create_engine # database connection
import datetime as dt

# loading wasn't too bad
# RAM use was 1 gig or less
# 4036 seconds: completed 10540000 rows

# create disk engine
disk_engine = create_engine('sqlite:///311_all.db')

# now that it's written to disk, do some queries
df = pd.read_sql_query('SELECT * FROM data LIMIT 3', disk_engine)
df.head()

# load just some columns
df = pd.read_sql_query('SELECT Agency, Descriptor FROM data LIMIT 3', disk_engine)
df.head()

# filter rows with WHERE
df = pd.read_sql_query('SELECT ComplaintType, Descriptor, Agency '
                       'FROM data '
                       'WHERE Agency = "NYPD" '
                       'LIMIT 10', disk_engine)
df.head()

# WHERE and IN
df = pd.read_sql_query('SELECT ComplaintType, Descriptor, Agency '
                       'FROM data '
                       'WHERE Agency IN ("NYPD", "DOB")'
                       'LIMIT 10', disk_engine)
df.head()

# DISTINCT
df = pd.read_sql_query('SELECT DISTINCT City FROM data', disk_engine)
df.head()

# which agency has the most complaints?
# COUNT, ORDER
import time
now = time.time()
ranked_by_complaints_df = pd.read_sql_query('SELECT Agency, COUNT(*) as `num_complaints`'
                                            'FROM data '
                                            'GROUP BY Agency '
                                            'ORDER BY -num_complaints', disk_engine)
print str(time.time() - now)+' seconds elapsed'
ranked_by_complaints_df

# 9.54034805298 seconds elapsed, holy crap that's fast

# plot that
import matplotlib.pyplot as plt
plt.ion()

ax = ranked_by_complaints_df.plot(kind='bar')
ax.set_xticklabels(df.Agency,rotation=90)
plt.yscale('log')
plt.tight_layout()

# filter noise complaints by hour
now = time.time()
noise_per_hour_df = pd.read_sql_query('SELECT CreatedDate, '
                                      'strftime(\'%H\', CreatedDate) as `hour`,  '
                                      'count(*) as `Noise Complaints per Hour`'
                                      'FROM data '
                                      'WHERE ComplaintType IN ("Noise", '
                                                              '"Noise - Street/Sidewalk", '
                                                              '"Noise - Commercial", '
                                                              '"Noise - Vehicle", '
                                                              '"Noise - Park", '
                                                              '"Noise - House of Worship", '
                                                              '"Noise - Helicopter", '
                                                              '"Collection Truck Noise") '
                                      'GROUP BY hour', disk_engine)
print str(time.time() - now)+' seconds elapsed'

# plot that
ax = noise_per_hour_df.plot(kind='bar')

#HPD = Housing Preservation and Development
