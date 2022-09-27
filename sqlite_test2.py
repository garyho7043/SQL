import sqlite3



conn = sqlite3.connect('user.db')
cursor = conn.cursor()



cursor.execute('DROP TABLE IF EXISTS users')
cursor.execute('CREATE TABLE IF NOT EXISTS users('
               'id INTEGER PRIMARY KEY, '
               'name TEXT, '
               'email TEXT, '
               'password TEXT' ')')








insert_query = 'INSERT INTO users VALUES(?, ?, ?, ?)'


data_num = 3
id = [1,2,6]
name = ['kirai','kirai1','kirai2']
email = ['abc.def@gmail.com','abc1.def@gmail.com','abc2.def@gmail.com']
password = ['123456','123456','123456']


users = []


for i in range(0,data_num):
    users.append((id[i], name[i], email[i], password[i]))


cursor.executemany(insert_query, users)



for row in cursor.execute('Select * From users'):
    print(row)





conn.commit()
conn.close()