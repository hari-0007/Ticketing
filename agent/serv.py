import socket, threading
import mysql.connector
from mysql.connector import Error
import sys
import json
import qrcode
import random
import string


# # do validation and checks before insert
# def validate_string(val):
#     if val != None:
#         if type(val) is int:
#             # for x in val:
#             #   print(x)
#             return str(val).encode('utf-8')
#         else:
#             return val

# def validate_string(data):
#     print(data)
#     # jsonReceived = json.dumps(data)
#     # print(jsonReceived)

#     try:
#         if "Agent_id" != "" and "Notes" != "" and "Public_ip_address" != "" and "Host_name" != "" and "DateTime"!="":
#             print("1")
#             insert(data)
#         else:
#             print("2")
#             insert_error(data)
#     except Error as err:
#         print("Error", err)


def insert(data):
    # global agent_id , notes , public_ip_address , host_name , time
    try:
        # print("10")
        # print(data)
        # jsonReceived = json.dumps(data)
        # print(jsonReceived)
        json_load = json.loads(data)
        print(json_load)

        agent_id = json_load[0]["Agent_id"]
        # print(agent_id)
        notes = json_load[0]["Notes"]
        # print(notes)
        public_ip_address = json_load[0]["Public_ip_address"]
        # print(public_ip_address)
        host_name = json_load[0]["Host_name"]
        # print(host_name)
        time = json_load[0]["DateTime"]
        # print(time)

        # for i, item in enumerate(json_load):
        #     agent_id = validate_string(item.get("Agent_id", None))
        #     notes = validate_string(item.get("Notes", None))
        #     public_ip_address = validate_string(item.get("Public_ip_address", None))
        #     host_name = validate_string(item.get("Host_name", None))
        #     time = validate_string(item.get("DateTime", None))

        # for obj in json_load:
        #     print(obj["Agent_id"])
        #     print(obj["Notes"])
        #     print(obj["Public_ip_address"])
        #     print(obj["Host_name"])
        #     print(obj["DateTime"])

        # jsonReceived = json.dumps(data)
        # print(jsonReceived)

        cmd = "INSERT INTO Ticket(Agent_id, Notes, Public_ip_address, Host_name, DateTime) VALUES (%s, %s, %s, %s, %s)"
        post = (agent_id, notes, public_ip_address, host_name, time)
        cursor.execute(cmd, post)

        # sql = "INSERT INTO Ticket ( Agent_id, Notes, Public_ip_address, Host_name, DateTime ) VALUES ( %(Agent_id)s,
        #                                         %(Notes)s, %(Public_ip_address)s, %(Host_name)s, %(DateTime)s)"
        # cursor.executemany(sql, json_load)

        strconnection.commit()
        # return "ok"
        # print("4")

    except Error as err:
        print("Error while inserting data to MySQL", err)
        cursor.close()

def insert_error(data1):
    try:
        # jsonReceived = json.dumps(data1)
        # print(jsonReceived)

        json_load = json.loads(data1)
        print(json_load)

        agent_Id = json_load[0]["Agent_id"]
        print(agent_Id)
        error_messages = json_load[0]["Error_messages"]
        print(error_messages)
        Time = json_load[0]["DateTime"]
        print(Time)

        cmd = "INSERT INTO Error_Tickets(Agent_id, Error_messages, DateTime) VALUES (%s, %s, %s)"
        post = (agent_Id, error_messages, Time)
        cursor.execute(cmd, post)
        strconnection.commit()

    except Error as err:
        print("Error while inserting data to MySQL", err)
        cursor.close()

total_connections = 0

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

    class ClientThread(threading.Thread):

        def __init__(self, clientAddress, clientsocket):
            threading.Thread.__init__(self)
            self.csocket = clientsocket
            print("New connection added: ", clientAddress)

        def run(self):
            global total_connections
            print("Connection from : ", clientAddress)
            print("New connection at ID " + str(total_connections), clientAddress)
            total_connections += 1
            # self.csocket.send(bytes("Hi, This is from Server..",'utf-8'))
            # data = ''
            # print(data)
            while True:
                self.csocket.send(b"Connected to server")
                msg = self.csocket.recv(2048)
                print(msg)
                try:
                    if not msg:
                        print("Client at ID " + str(total_connections), clientAddress, " disconnected...")
                        clientsock.close()
                except:
                    pass
                data = msg.decode('UTF-8')
                print("Client : ", clientAddress, data)
                try:
                    insert(data)

                    # if msg=='bye':
                    #   break
                    # print("from client", msg)
                    # self.csocket.send(bytes(msg,'UTF-8'))
                    # jsonReceived = json.dumps(data)
                    # print(jsonReceived)
                    # insert(jsonReceived)
                    # insert(data)
                    # print(new)

                    # insert_error(data1)

                    self.csocket.send(b"Inserted Successfully!!")

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
                        self.csocket.send(f.read())
                        f.read()
                        # im = Image.open(l)
                        # im.show()
                        f.close()

                    self.csocket.send(link.encode('ascii'))

                    try:
                        msg1 = self.csocket.recv(2048)
                        print(msg1)
                        data1 = msg1.decode('UTF-8')
                        print("Client : ", clientAddress, data1)
                        # if "Agent_id" != "" and "Notes" != "" and "Public_ip_address" != "" and "Host_name" != "" and "DateTime" != "":
                        #     insert(data1)
                        # else:
                        #     insert_error(data1)
                        if data1 != "":
                            insert_error(data1)
                        else:
                            print("Empty data...")

                        self.csocket.send(b"Completed!!!")
                    except:
                        pass

                except Error as err:
                    print("Error...", err)

                # if not data:
                #     break
        #
        #     # self.csocket.send(b"Completed!!!")
        #     print("Client at ID " + str(total_connections), clientAddress, " disconnected...")
        # # exit(0)

    LOCALHOST = "192.168.0.104"
    PORT = 5555

    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((LOCALHOST, PORT))
    # print("\n")
    print("Server started!!!")
    print("Waiting for client request...")
    print("\n")
    while True:
        server.listen(1)
        clientsock, clientAddress = server.accept()

        # Generate a random string with 32 characters.
        # rand = ''.join([random.choice(string.ascii_letters + string.digits) for n in range(32)])
        # print(rand)
        # msg = server.recv(1024).decode()
        # print(msg)
        new_thread = ClientThread(clientAddress, clientsock)
        new_thread.start()

except Error as e:
    print("Error while connecting to MySQL", e)
    sys.exit(0)

