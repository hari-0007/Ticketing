import socket
import threading
import sys
import mysql.connector
from mysql.connector import Error
import json
import qrcode

total_connections = 0

# s = socket.socket()
host = "192.168.0.104"
port = 5555

s = socket.socket()
s.bind((host, port))

s.listen(5)

def insert(data):
    try:
        json_load = json.loads(data)
        # print(json_load)

        agent_id = json_load[0]["Agent_id"]
        notes = json_load[0]["Notes"]
        public_ip_address = json_load[0]["Public_ip_address"]
        host_name = json_load[0]["Host_name"]
        time = json_load[0]["DateTime"]

        cmd = "INSERT INTO Ticket(Agent_id, Notes, Public_ip_address, Host_name, DateTime) VALUES (%s, %s, %s, %s, %s)"
        post = (agent_id, notes, public_ip_address, host_name, time)
        cursor.execute(cmd, post)

        strconnection.commit()

    except Error as err:
        print("Error while inserting data to MySQL", err)
        cursor.close()

def insert_error(data1):
    try:
        json_load = json.loads(data1)
        # print(json_load)

        agent_Id = json_load[0]["Agent_id"]
        # print(agent_Id)
        error_messages = json_load[0]["Error_messages"]
        # print(error_messages)
        Time = json_load[0]["DateTime"]
        # print(Time)

        cmd = "INSERT INTO Error_Tickets(Agent_id, Error_messages, DateTime) VALUES (%s, %s, %s)"
        post = (agent_Id, error_messages, Time)
        cursor.execute(cmd, post)
        strconnection.commit()

    except Error as err:
        print("Error while inserting data to MySQL", err)
        cursor.close()


try:
    strconnection = mysql.connector.connect(host='192.168.0.103',
                                            database='Allitsondb',
                                            user='Allitson',
                                            password='welcome',
                                            auth_plugin='mysql_native_password')

    if strconnection.is_connected():
        db_Info = strconnection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = strconnection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
    sys.exit(0)

def processMessages(conn, addr):
    while True:
        conn.send(b"Connected to server")
        msg = conn.recv(2048)
        print(msg)
        if not msg:
            break
        data = msg.decode('UTF-8')
        try:
            insert(data)

            conn.send(b"Inserted Successfully!!")

            # url = 'https://abcd.com/efgh/?'
            # params = {'var1': "Tracking Link", 'var2': 1337}
            # link = url + urllib.parse.urlencode(params)
            link = 'https://www.google.com/'

            # Data to encode
            # data1 = "Tracking Link"

            # Creating an instance of QRCode class
            qr = qrcode.QRCode(version=1, box_size=10, border=5)

            # Adding data to the instance 'qr'
            qr.add_data(link)

            qr.make(fit=True)
            img = qr.make_image(fill_color='black', back_color='white')

            img.save('MyQRCode1.png')

            with open('MyQRCode1.png', 'rb') as f:
                conn.send(f.read())
                f.read()
                # im = Image.open(l)
                # im.show()
                f.close()

            conn.send(link.encode('ascii'))

            try:
                msg1 = conn.recv(2048)
                print(msg1)
                data1 = msg1.decode('UTF-8')
                if data1 != b"Invalid...":
                    insert_error(data1)
                # else:
                #     print("Empty data...")

                # if data1 == b"Invalid...":
                #     pass
                # # elif data1 == b"Invalid...":
                # #     pass
                # else:
                #     insert_error(data1)
                #     # print("Empty data...")

                # conn.send(b"Completed!!!")
            except:
                pass

        except Error as err:
            print("Error...", err)

    print('Connection from ID', str(total_connections), str('ClientAddress'), str(addr[0]) + ':' + str(addr[1]), str('disconnected'))
    conn.close()

while True:
    # Wait for connections
    conn, addr = s.accept()
    # print(addr)
    print('Got connection from ', addr[0], ':', addr[1])
    print('Got connection from ID', str(total_connections), str('ClientAddress'), str(addr[0]) + ':' + str(addr[1]))
    # print("New connection at ID " + str(total_connections) , clientAddress)
    total_connections += 1
    # Listen for messages on this connection
    listener = threading.Thread(target=processMessages, args=(conn, addr))
    listener.start()
