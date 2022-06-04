import json
import os
import socket
import string
import random
import threading
import sys
import urllib.request
import tkinter
import webbrowser
from time import strftime, localtime

import uuid as uuid

from tkinter import *
from tkinter import Tk, Frame

import pystray
from PyQt5 import QtGui
from PyQt5.QtCore import QTimer
from mysql.connector import Error
from tkinter.font import nametofont, Font
from tkinter.ttk import Style

from PIL import Image, ImageTk

from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from time import time
from os import path

app = QApplication([])
app.setQuitOnLastWindowClosed(False)
# while app.setQuitOnLastWindowClosed(True):
#     sys.exit(0)

# Create the icon
# icon = QIcon("icon.png")
global users
global e1
global sock
root = Tk()

p1 = PhotoImage(file='icon.png')

# import ctypes
#
# myappid = 'mycompany.myproduct.subproduct.version' # arbitrary string
# ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID(myappid)
# root.iconphoto(False, p1)
# def disable_event():
#    pass

#Wait for incoming data from server
#.decode is used to turn the message in bytes to a string
# def receive(socket, signal):
#     while signal:
#         try:
#             data = socket.recv(32)
#             print(str(data.decode("utf-8")))
#         except:
#             print("You have been disconnected from the server")
#             signal = False
#             break

def get_background_of_widget(widget):
    try:
        # We assume first tk widget
        background = widget.cget("background")
    except:
        # Otherwise this is a ttk widget
        style = widget.cget("style")

        if style == "":
            # if there is no style configuration option, default style is same as widget class
            style = widget.winfo_class()

        background = Style().lookup(style, 'background')

    return background


class Link_Button(Label, object):
    def __init__(self, master, text, background=None, font=None, family=None, size=None, underline=True,
                 visited_fg="#551A8B", normal_fg="#0000EE", visited=False, action=None):
        self._visited_fg = visited_fg
        self._normal_fg = normal_fg

        if visited:
            fg = self._visited_fg
        else:
            fg = self._normal_fg

        if font is None:
            default_font = nametofont("TkDefaultFont")
            family = default_font.cget("family")

            if size is None:
                size = default_font.cget("size")

            font = Font(family=family, size=size, underline=True)

        Label.__init__(self, master, text=text, fg=fg, cursor="hand2", font=font)

        if background is None:
            background = get_background_of_widget(master)

        self.configure(background=background)

        self._visited = visited
        self._action = action

        self.bind("<Button-1>", self._on_click)

    @property
    def visited(self):
        return self._visited

    @visited.setter
    def visited(self, is_visited):
        if is_visited:
            self.configure(fg=self._visited_fg)
            self._visited = True
        else:
            self.configure(fg=self._normal_fg)
            self._visited = False

    def _on_click(self, event):
        if not self._visited:
            self.configure(fg=self._visited_fg)

        self._visited = True

        if self._action:
            self._action()


def no():
    e1.delete("1.0", "end")
    root.iconify()
    # sys.exit(0)


def desty():
    # e1.delete('1.0', END)
    e1.destroy()
    l1.destroy()
    b1.destroy()
    b2.destroy()

def exitt():
    # root.destroy()
    label1.destroy()
    link1.destroy()
    b3.destroy()
    loop()

def ok():
    # agent_id = e1.get()
    global notes
    # notes = e1.get()
    notes = e1.get(1.0, "end-1c")
    # global l2

    if notes == "":
        desty()
        check()
    else:
        val()

def agent():
    # print ("The MAC address in formatted way is : ")
    a = (':'.join(['{:02x}'.format((uuid.getnode() >> ele) & 0xff) for ele in range(0, 8 * 6, 8)][::-1]))

    # initializing string
    test_str = str(a)

    # initializing punctuations string
    punc = '''!()-[]{};:'"\,<>./?@#$%^&*_~'''

    # Removing punctuations in string
    # Using loop + punctuation string
    for ele in test_str:
        if ele in punc:
            test_str = test_str.replace(ele, "")

    agent_id = test_str
    return agent_id

def val():
    global agent_id, public_ip_address, host_name, time

    agent_id = agent()
    # hostname = socket.gethostname()
    # IPAddress = socket.gethostbyname(hostname)

    public_ip_address = urllib.request.urlopen('https://ident.me').read().decode('utf8')
    # print("Public ip address : ", public_ip_address)

    host_name = socket.gethostname()
    # print("Host name : ",host_name)
    # now = datetime.now()
    dt_string = strftime("%Y-%m-%d %H:%M:%S", localtime())
    time = dt_string
    # print("Datetime : ",time)
    out()


def out():
    global users
    global sock
    users = [
        {
            "Agent_id": "",
            "Notes": "",
            "Public_ip_address": "",
            "Host_name": "",
            "DateTime": ""
        }
    ]

    for user in users:
        user['Agent_id'] = agent_id
        user['Notes'] = notes
        user['Public_ip_address'] = public_ip_address
        user['Host_name'] = host_name
        user['DateTime'] = time

    users1 = users
    # print(users1)

    users = json.dumps(users)
    # print(users)

    # faff = validate(session)
    # print(faff)
    # if faf == True and faff == True:

    # result = sock.connect_ex(('192.168.0.104', 5555))
    # if result == 0:
    #     print("Port is open")
    #     return True
    # else:
    #     print("Port is not open")
    #     sock.close()

    if faf == True:
        try:
            my_path = 'users.json'
            global error_messages, agent_Id, Time
            if path.exists(my_path):
                with open('users.json') as f:
                    data = json.load(f)
                print(data)
                # error_messages = data
                error_messages = str(data)
                agent_Id = agent()
                dt_string1 = strftime("%Y-%m-%d %H:%M:%S", localtime())
                Time = dt_string1
                result()
            else:
                pass
        except:
            pass

    else:
        my_path = 'users.json'
        if path.exists(my_path):
            with open(my_path, 'r') as file:
                previous_json = json.load(file)
                users1 = previous_json + users1
                # print(users1)
                with open(my_path, 'w') as file:
                    json.dump(users1, file, indent=4)
                print("Could not make a connection to the server...")
                sys.exit(0)

        else:
            with open(my_path, 'w') as file:
                json.dump(users1, file, indent=4)
            print("Could not make a connection to the server...")
            sys.exit(0)

    # sock.send(str.encode(users))
    sock.send(str.encode(users, 'UTF-8'))
    # sock.sendall(bytes(users, 'UTF-8'))
    qrlink()

def qrlink():
    received = sock.recv(1024)
    print(received)

    # receive = sock.recv(1024)
    # print(receive)

    # if received == "Invalid":
    #     out()
    # else:
    #     pass

    with open('MyQRCode.png', 'wb') as f:
        print('file opened')
        data = sock.recv(4000)
        f.write(data)
        # print(data)
        f.close()

    global link, label1, link1, b3

    link = sock.recv(1024).decode('ascii')
    print(link)

    # output = sock.recv(1024)
    # print(output)
    try:
        users_error1 = result()
        print(users_error1)
        if users_error1 != "":
            sock.send(str.encode(users_error1, 'UTF-8'))
        else:
            print("Empty data...")
        res = sock.recv(1024)
        print(res)
    except:
        sock.send(b"Invalid...")

    # sock.send(b"Inserted Successfully!!")
    # res = sock.recv(1024)
    # print(res)

    # import os
    # if os.path.exists("users.json"):
    #     os.remove("users.json")
    # else:
    #     pass

    root.title("Your Tracking Link & Qrcode...")
    # root.iconbitmap(default='icon.png')
    root.iconphoto(False, p1)
    # root.geometry("600x500")
    desty()
    # Create a photo image object of the image in the path
    image1 = Image.open("MyQRCode.png")
    test = ImageTk.PhotoImage(image1)

    label1 = tkinter.Label(image=test)
    label1.image = test

    # Position image
    label1.place(x=50, y=50)

    link1 = Link_Button(root, text="Tracking Link", action=callback)
    link1.pack(padx=10, pady=10)

    b3 = Button(root, text="Exit", font=('Comic Sans MS', 10), command=exitt, height=3, width=15)
    b3.place(x=140, y=420)
    # sock.send(b"Inserted Successfully!!")

    # res = sock.recv(1024)
    # print(res)

    # import os
    # if os.path.exists("users.json"):
    #     os.remove("users.json")
    # else:
    #     print("................................................................")


# Hide the window and show on the system taskbar
# def hide_window():
#    root.withdraw()
#    image=Image.open("icon.png")
   # menu=(item('Quit', quit_window), item('Show', show_window))
   # icon=pystray.Icon("name", image, "My System Tray Icon")
   # icon.run()

def loop():
    root.after(1, check)
    root.protocol("WM_DELETE_WINDOW", root.withdraw)
    root.mainloop()

    # # Create new thread to wait for data
    # receiveThread = threading.Thread(target=receive, args=(sock, True))
    # receiveThread.start()
    #
    # # Send data to server
    # # str.encode is used to turn the string message into bytes, so it can be sent across the network
    # while True:
    #     message = input()
    #     sock.sendall(str.encode(message))
    # # if root.destroy
    # # main()
    # # sys.exit(0)

def callback():
    d = webbrowser.open_new(link)
    return d

# def validate(session):
#     try:
#         # Try to get the underlying session connection, If you can get it, its up
#         connection = session.connection()
#         return True
#     except:
#         return False

def result():
    users_error = [
        {
            "Agent_id": "",
            "Error_messages": "",
            "DateTime": ""
        }
    ]

    for user_error in users_error:
        user_error['Agent_id'] = agent_Id
        user_error['Error_messages'] = error_messages
        user_error['DateTime'] = Time

    # users1 = users_error
    # print(users1)

    users_error = json.dumps(users_error)
    print(users_error)
    return users_error

def check():
    root.title("Enter the details")
    # root.iconbitmap(default='icon.png')
    root.iconphoto(False, p1)
    root.geometry("600x500")
    # global e1

    global l1, e1, b1, b2
    l1 = Label(root, text="Notes", font=('Comic Sans MS', 25))
    l1.place(x=20, y=80)

    # e1 = Entry(root)
    # e1.place(x=140, y=10)
    # global e1
    e1 = Text(root, height=6, width=42)
    e1.place(x=140, y=80)

    # global b1, b2
    b1 = Button(root, text="Add", font=('Comic Sans MS', 10), command=ok, height=3, width=15)
    b1.place(x=140, y=320)
    b2 = Button(root, text="Reject", font=('Comic Sans MS', 10), command=no, height=3, width=15)
    b2.place(x=340, y=320)

    # root.after(2000, check)
    root.protocol("WM_DELETE_WINDOW", root.withdraw)
    root.mainloop()

# def receive(socket, signal):
#     while signal:
#         try:
#             socket.recv(32)
#             # sys.exit(0)
#             # print(str(data.decode("utf-8")))
#         except:
#             print("You have been disconnected from the server")
#             signal = False
#             break

# Define a function to check if a widget exists or not
def check_widget():
    exists = root.winfo_exists()
    if exists == True:
        # root.lift()
        action1.setEnabled(False)
        check()
    else:
        check()

def raise_ticket():
    check_widget()
    # check()
    # action1.setEnabled(False)

def track_updates():
    exit(0)

def about():
    exit(0)

def con():
    # threading.Timer(5.0, con).start()
    global sock
    # Get host and port
    host = "192.168.0.104"
    port = 5555

    # while True:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # sock = sock.ioctl(socket.SIO_KEEPALIVE_VALS, (1, 10000, 3000))
    try:
        sock.connect((host, port))
        # connected = True
        # rand = ''.join([random.choice(string.ascii_letters + string.digits) for n in range(32)])
        # print(rand)
        # sock.send(rand.encode())
        # sock.send(rand)
        return True
    except socket.error:
        return False
    #     # set connection status and recreate socket
    #     connected = False
    #     clientSocket = socket.socket()
    #     print("connection lost... reconnecting")
    #     # threading.Timer(5.0, con).start()
    #     while not connected:
    #         try:
    #             clientSocket.connect((host, port))
    #             connected = True
    #             print("re-connection successful")
    #         except socket.error:
    #             return False
    # # except:
    # #     return False

# def main():
class MainWindow(QMainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        global faf, action1
        # rand = ''.join([random.choice(string.ascii_letters + string.digits) for n in range(32)])
        # print(rand)
        # sock.send(rand.encode())
        faf = con()
        print(faf)

        self.trayIcon = QSystemTrayIcon()

        if faf == True:
            # self.tray.setToolTip("Allitson - Connected to server")
            self.trayIcon.setIcon(QIcon('icon.png'))
        else:
            # self.tray.setToolTip("Allitson - No connection!!!")
            # self.trayIcon.setIcon('wng.png')
            # self.setWindowIcon(QIcon('wng.png'))
            self.trayIcon.setIcon(QIcon('wicon.png'))

        # Create the tray

        # self.trayIcon.setIcon(icon)
        self.trayIcon.setVisible(True)
        self.trayIcon.setToolTip("Allitson")
        # self.setWindowIcon(QtGui.QIcon('icon.png'))
        # self.setWindowIcon(QIcon('icon.png'))
        # self.trayIcon = QSystemTrayIcon(QIcon("icon.png"), self)

        self.trayIcon.activated.connect(self.onTrayIconActivated)
        self.trayIcon.show()
        self.disambiguateTimer = QTimer(self)
        self.disambiguateTimer.setSingleShot(True)
        self.disambiguateTimer.timeout.connect(self.disambiguateTimerTimeout)

        # def onTrayIconActivated(self , reason):
        #     print("onTrayIconActivated: ", reason)
        #     if reason == QSystemTrayIcon.Trigger:
        #         self.disambiguateTimer.start(qApp.doubleClickInterval())
        #     elif reason == QSystemTrayIcon.DoubleClick:
        #         self.disambiguateTimer.stop()
        #         print("Tray icon double clicked")

        # def disambiguateTimerTimeout(self):
        #     print("Tray icon single clicked")

        # left = QAction("Raise Ticket")
        # QAction(triggered.connect(raise_ticket))
        # tray.OnTaskbarLeftClick

        # tray.show()
        # tray.showMessage('VFX Pipeline', 'Hello Name of logged in ID')
        # Create the menu
        menu = QMenu()
        action1 = QAction("Raise Ticket")
        if action1:
            action1.triggered.connect(raise_ticket)
            menu.addAction(action1)

        action2 = QAction("Track Updates")
        if action2:
            action2.triggered.connect(track_updates)
            menu.addAction(action2)

        action3 = QAction("About")
        if action3:
            action3.triggered.connect(about)
            menu.addAction(action3)

        # Add the menu to the tray
        self.trayIcon.setContextMenu(menu)
        app.exec_()

    def onTrayIconActivated(self, reason):
        # print("onTrayIconActivated: ", reason)
        if reason == QSystemTrayIcon.Trigger:
            self.disambiguateTimer.start(qApp.doubleClickInterval())
        elif reason == QSystemTrayIcon.DoubleClick:
            self.disambiguateTimer.stop()
            # print("Tray icon double clicked")

    def disambiguateTimerTimeout(self):
        # print("Tray icon single clicked")
        # raise_ticket()
        # try:
        root.deiconify()
        # except:
        #     raise_ticket()

# main()


if __name__ == "__main__":
    # app = QApplication(sys.argv)
    MainWindow()
    # w.show()
    # sys.exit(app.exec_())
