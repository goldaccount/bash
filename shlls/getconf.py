import csv
import sys
from datetime import datetime
from netmiko import ConnectHandler

#Use ip from csv to connect
def connect(ip1,user,passh,pasen):
    s = {
    "device_type":"cisco_ios",
    "ip": ip1,
    "username": user,
    "password": passh,
    "secret": pasen,
    }
    ConnectHandler(**s)
    cc=ConnectHandler(**s)
    cc.enable()    
    config=(cc.send_command('sh run'))
    cc.disconnect()
#Return content of command
    return config

#Use ip from csv to connect
def connect_telnet(ip1,user,passh,pasen):
    s = {
    "device_type":"cisco_ios_telnet",
    "ip": ip1,
    "username": user,
    "password": passh,
    "secret": pasen,
    }
    ConnectHandler(**s)
    cc=ConnectHandler(**s)
    cc.enable()    
    config=(cc.send_command('sh run'))
    cc.disconnect()
#Return content of command
    return config


#Return current date time for file write
def currentdate():
    dt = datetime.now()
    outputdate=dt.strftime("%y%m%d_%H%M%S")
    return outputdate

#Write to file with devicename, content, and destfilepath 
def writefile(devicename,content,destfilepath):
    outputdate=currentdate()
    filename=destfilepath+devicename+"_"+outputdate
    outputfile=open(filename,'w',newline='')
    outputfile.writelines(content)
    outputfile.close()

#Use system ping to ping instead of raw socket to avoid need for root permission
def testping(ip):
    from os import system
    pingstatus = system("ping -c 2 " + ip + "> /dev/null")
    if pingstatus == 0:
        return True
    else:
        return False


#Read rows from input csv, test ping with IP, if True, call connect function with infos, return config of switch, if False, do not process anything --> no stuck @ connect, added telnet check
def openfile(inputcsv,destfilepath):
    readcsv=csv.DictReader(inputcsv,delimiter=',')
    inputfields=readcsv.fieldnames
    config=""
    for row in readcsv:
        if testping(row['IP']) == True:
            print("Connecting to [",row['NAME'],"] ...")
            if row['NOTED'] == "ssh":
                config = connect(ip1 = row['IP'],user = row['USER'],passh = row['PASS'], pasen = row['ENABLE'])
            else:
                if row['NOTED'] == "telnet":
                    config = connect_telnet(ip1 = row['IP'],user = row['USER'],passh = row['PASS'], pasen = row['ENABLE'])
            print("Backing up running config to file ",row['NAME'],currentdate())
            writefile(devicename = row['NAME'],content = config,destfilepath = destfilepath)
            print("Config backed up.")
    inputcsv.close()
    print("Job completed")

#Call open file, parse open object from first argument, pass second argument as output file path
openfile(inputcsv = open(sys.argv[1],'r'), destfilepath = sys.argv[2])


#---------------Testing-----------------------
#x = testping(sys.argv[1])
#if x == True:
#    print("OK")
#else:
#    print("Not OK")
#out=writefile()
#print(out)
#x = connect("172.16.159.145","tiavn","ti@T0!","t0En@ble")
#print(x)
#writefile(devicename = "FS-0166",content="aaaa")
