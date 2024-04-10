import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError




#value to connect server
server="LAPTOP-CJG2OK7J\SQLEXPRESS"
database="sql_practice"
 
#create engine
engine = create_engine('mssql+pyodbc://@' + 'LAPTOP-CJG2OK7J\SQLEXPRESS' + '/' + 'sql_practice' + '?trusted_connection=yes&driver=SQL+Server+Native+Client+11.0')


#test connection
try:
    engine.connect()
    print("success")
except SQLAlchemyError as err:
    print("error", err.__cause__)


#read sql
with engine.connect() as conn:
   df = pd.read_sql_query('SELECT * FROM [sql_practice].[dbo].[EV_sales]', conn)


df.to_csv('EV_sales.csv')
