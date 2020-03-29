echo "Starting PiCAST3..."
forever start picast.js
echo "Health check..."
sleep 5
nc -v -w 1 localhost 3000
