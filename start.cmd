cd /D %~dp0
chcp 65001
java -Dfile.encoding=UTF-8 -jar agent.jar -jnlpUrl http://localhost:8080/computer/windows-1/slave-agent.jnlp -secret 538b6a8773c03fe2bb99c3e7b33a0806defbf01620d0dfd20ee325ac87f6113a -workDir "D:\Repo\jenkins\jenkins_slave"