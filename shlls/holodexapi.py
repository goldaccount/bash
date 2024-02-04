import requests
import sys

def queryapi(_channel, _topic, _outfile, _offset): 
	url = "https://holodex.net/api/v2/videos"
	
	querystring = {"channel_id":_channel,"topic":_topic,"type":"stream","status":"past","limit":"25","offset":_offset}
	
	headers = {"X-APIKEY": "20f220c9-070f-4481-9fe3-308802140f38"}
	
	response = requests.request("GET", url, headers=headers, params=querystring)
	
	r = response.json()
	
	i = 1
	while i < len(r):
#		_outfile.write(r[i].get('id')+"\t"+r[i].get('title')+"\n")
		_outfile.write('https://youtu.be/'+r[i].get('id')+"\n")
		i += 1
_channel = sys.argv[1]
_topic = sys.argv[2]
_outfile = open(sys.argv[3],"a")
_offset = sys.argv[4]
queryapi(_channel, _topic, _outfile, _offset) 
_outfile.close()

