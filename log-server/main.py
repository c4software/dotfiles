import http.server
import sys
import signal

class RequestHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length)
        print(f"Received POST request: {post_data.decode()}")
        self.send_response(201)
        self.end_headers()

def create_server(port):
    server = http.server.ThreadingHTTPServer(("", port), RequestHandler)
    server.allow_reuse_address = True  # Permet de réutiliser le port immédiatement
    return server

def main():
    PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
    
    httpd = create_server(PORT)
    
    # Gestion de Ctrl+C
    def signal_handler(signum, frame):
        print("\nArrêt du serveur...")
        httpd.server_close()
        sys.exit(0)
    
    signal.signal(signal.SIGINT, signal_handler)
    
    print(f"Server started on port {PORT}")
    try:
        httpd.serve_forever()
    finally:
        httpd.server_close()

if __name__ == "__main__":
    main()