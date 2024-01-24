#!/bin/python

import requests

api_url = "https://paracausal.science/vendors/all.json"

response = requests.get(api_url)

output = response.json()

try:
    index = output['Response']['vendors']['data']['2190858386']['vendorLocationIndex']
except:
    index = -1

match index:
    case 0:
        location = "at the Tower (Hangar)"
    case 1:
        location = "in the EDZ (Winding Cove)"
    case 2:
        location = "on Nessus (Watcher's Grave)"
    case _:
        location = "away"

print("Xûr is " + location + ".")



#output = json.dumps(json.loads(response.content.decode('utf-8')), indent=2)
#output = response.content.decode('utf-8')

#print(response.json()['Response'])
#print(response.json()['Response']['vendorGroups']['data'])
#print(output['Response']['data']['data']['inventoryItem']['itemName'])

