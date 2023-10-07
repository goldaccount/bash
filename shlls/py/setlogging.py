import csv
import sys
from datetime import datetime
from netmiko import ConnectHandler

#Use ip from csv to connect
def connect(ip1,user,passh,pasen,configfile):
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
    config=cc.send_config_from_file(configfile)
    cc.exit_enable_mode()
    cc.send_command('write')
    cc.disconnect()

#Use ip from csv to connect
def connect_telnet(ip1,user,passh,pasen,configfile):
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
    config=cc.send_config_from_file(configfile)
    cc.exit_enable_mode()
    cc.send_command('write')
    cc.disconnect()


#Return current date time for file write
def currentdate():
    dt = datetime.now()
    outputdate=dt.strftime("%y%m%d_%H%M%S")
    return outputdate

def writefile(devicename,content):
    outputdate=currentdate()
    filename=devicename+"_"+outputdate
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

#Read rows from input csv, call connect function with infos, return config of switch
def openfile(inputcsv,configcommand):
    readcsv=csv.DictReader(inputcsv,delimiter=',')
    inputfields=readcsv.fieldnames
    for row in readcsv:
        if testping(row['IP']) == True:
            print("Connecting to [",row['NAME'],"] ...")
            if row['NOTED'] == "ssh":
                config = connect(ip1 = row['IP'],user = row['USER'],passh = row['PASS'],pasen = row['ENABLE'],configfile = configcommand)
            else:
                if row['NOTED'] == "Telnet":
                    config = connect_telnet(ip1 = row['IP'],user = row['USER'],passh = row['PASS'],pasen = row['ENABLE'],configfile = configcommand)
            print("Configuring ",row['NAME'],currentdate())
            print("Config applied.")
    inputcsv.close()
    print("Job completed")

#Call open file, parse open object from first argument
#Syntax: 
print("Syntax: <command> <password file> <configfile>")
openfile(open(sys.argv[1],'r'),sys.argv[2])

#---------------Testing-----------------------
#out=writefile()
#print(out)
#x = connect("172.16.159.145","tiavn","ti@T0!","t0En@ble")
#print(x)
#writefile(devicename = "FS-0166",content="aaaa")
