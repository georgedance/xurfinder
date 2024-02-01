#!/bin/python

try:
    import requests
except:
    import subprocess
    try:
        assert(subprocess.call(["pip", "install", "requests"],
            stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT) == 0)
        import requests
    except:
        raise

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

