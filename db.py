import psycopg2
from psycopg2 import DatabaseError

def get_connection():

    try:

        return psycopg2.connect(
            
            host="localhost",
            user="postgres",
            password="Yayel.2027",
            database="app_flask"

        )

    except DatabaseError as ex:
        raise ex

    