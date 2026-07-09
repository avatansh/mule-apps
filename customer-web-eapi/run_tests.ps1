# JAVA_TOOL_OPTIONS is inherited by ALL forked JVM processes (Maven + MUnit runner)
$env:JAVA_TOOL_OPTIONS = "--add-opens=java.base/com.sun.crypto.provider=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED --add-opens=java.base/java.security=ALL-UNNAMED --add-opens=java.base/java.security.cert=ALL-UNNAMED --add-opens=java.base/java.text=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.base/javax.crypto=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jar=ALL-UNNAMED --add-opens=java.base/sun.security.pkcs=ALL-UNNAMED --add-opens=java.base/sun.security.provider=ALL-UNNAMED --add-opens=java.base/sun.security.x509=ALL-UNNAMED --add-opens=java.desktop/java.awt.font=ALL-UNNAMED --add-opens=java.desktop/java.beans=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.impl=ALL-UNNAMED -Denv=dev -Dencrypt.key=secure12345"
$env:MAVEN_OPTS = ""
$env:MUNIT_OPTS = ""
$mvn = "C:\Users\avatansh.sharma\apache-maven-3.8.8\bin\mvn.cmd"
$settings = "C:\Users\avatansh.sharma\Documents\Git\Avatansh-GitHub\Mule Apps\mule-settings.xml"
& $mvn test -s $settings
