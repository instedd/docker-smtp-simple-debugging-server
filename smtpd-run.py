import smtpd
import asyncore
import signal

def handler(signum, frame):
  exit()

signal.signal(signal.SIGTERM, handler)

d = smtpd.DebuggingServer(('0.0.0.0', 25), None)

try:
  print("SMTP debugging server started")
  asyncore.loop()
except KeyboardInterrupt:
  pass
