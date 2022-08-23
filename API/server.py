import os
import json
from flask import jsonify, flash, request, Flask, make_response
import base64
import random
import time
app = Flask(__name__)


topsvg = '''<svg width="500" height="500" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
      <linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1">
        <stop offset="0%" stop-color="{}"/>
        <stop offset="100%" stop-color="{}"/>
      </linearGradient>
  </defs>
'''
basesvg = open("basesvg").read()
bottomsvg = '''Hi {}</text>
  <text x="50%" y="30%" class="add" dominant-baseline="middle" text-anchor="middle">Your footprint is {} Tons of C02</text>
  <text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">That is lot!</text>
  <text x="50%" y="70%" class="base" dominant-baseline="middle" text-anchor="middle">You could take some actions to lower it</text>
  <text x="50%" y="85%" class="add" dominant-baseline="middle" text-anchor="middle">Thant's like {:.2f} Eth transactions</text>
</svg>
'''
sol1 = open("base.sol").read()
sol3 = open("last.sol").read()
svgsol = '''   _setTokenURI(newItemId, "data:application/json;base64,{}");
'''

colors = open("swatches.txt").read()
colors = colors.split("\n")
colors = [x.split(",") for x in colors]


def gen_sol(svg):
    solidity = sol1 + svgsol.format(svg) + sol3
    with open("contracts/footprint.sol", "w") as f:
        f.write(solidity)


def randomcolors():
    return random.choices(colors)[0]


def encodedjson(address, cotons, trans):
    preffix = '''{"name":"f00tprint","description":"a nft of your carbon footprint","image":"data:image/svg+xml;base64,'''
    c1, c2 = randomcolors()
    message = topsvg.format(c1, c2) + basesvg + \
        bottomsvg.format(address, cotons, trans)
    with open("testsvg.svg", "w") as f:
        f.write(message)
    message_bytes = message.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('ascii')
    base64_message = preffix + base64_message + '''"}'''

    message_bytes = base64_message.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('ascii')

    return base64_message


def gen_tons_trans(data):
    co2 = 9
    address = data['wallet']
    cotons = co2 + int(data['cars']) * 2 + \
        int(data['shortflights']) + int(data['longflights']) * 2.5
    trans = cotons/103.42
    return address, cotons, trans


@app.route('/mint', methods=['POST'])
def mint():
    data = json.loads(request.get_data().decode())  # ['json_payload']
    # print(data)
    address, cotons, trans = gen_tons_trans(data)
    encjson = encodedjson(address, cotons, trans)
    gen_sol(encjson)
    time.sleep(3)
    os.system("npx hardhat run scripts/deploy.js --network mumbai")
    return jsonify({"status": "Minted"})


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
