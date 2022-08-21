import os
from flask import jsonify, flash, request, Flask, make_response

app = Flask(__name__)


@app.route('/mint', methods=['POST'])
def mint():
    data = request.get_json()  # ['json_payload']
    print(data)
    return jsonify({"status": "Minted"})


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
