import sqlite3



conn = sqlite3.connect('user.db')
cursor = conn.cursor()



cursor.execute('DROP TABLE IF EXISTS users')
cursor.execute('CREATE TABLE IF NOT EXISTS users('
               'id INTEGER PRIMARY KEY, '
               'name TEXT, '
               'email TEXT, '
               'password TEXT)')








insert_query = 'INSERT INTO users VALUES(?, ?, ?, ?)'

users = []

users.append((None, 'kirai', 'abc.def@gmail.com', '123456'))
users.append((None, 'kirai1', 'abc1.def@gmail.com', '123456'))
users.append((None, 'kirai2', 'abc2.def@gmail.com', '123456'))

cursor.executemany(insert_query, users)



for row in cursor.execute('Select * From users'):
    print(row)





conn.commit()
conn.close()