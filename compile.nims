import os
import strformat

echo "Running"
for path in listFiles("./nim/client"):
  let file = path.splitPath()[1]
  let command = &"js -o:\"./public/{file}.js\" \"./{path}\""
  echo command
  selfExec command

for path in listFiles("./nim/server"):
  let file = path.splitPath()[1]
  let command = &"js -o:\"./server/{file}.js\" \"./{path}\""
  echo command
  selfExec command

# let command = "node server"
# echo command
# exec command