from http.server import BaseHTTPRequestHandler, HTTPServer
from sys import argv

NAME = argv[1]
PORT = int(argv[2])

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()

        body = bytes("OK {} {}\n".format(NAME, PORT), 'utf8')
        self.wfile.write(body)

httpd = HTTPServer(("", PORT), RequestHandler)
httpd.serve_forever()
