# Check SHA1
$sha1File = 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\eclipse\aether\aether-connector-basic\1.0.2.v20150114\aether-connector-basic-1.0.2.v20150114.jar.sha1'
$jarFile = 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\eclipse\aether\aether-connector-basic\1.0.2.v20150114\aether-connector-basic-1.0.2.v20150114.jar'
$expected = Get-Content $sha1File
$actual = (Get-FileHash $jarFile -Algorithm SHA1).Hash
Write-Host "Expected SHA1: $expected"
Write-Host "Actual SHA1:   $actual"
Write-Host "Match: $($expected.ToUpper() -eq $actual.ToUpper())"

# Show full mule-maven-plugin POM
Write-Host "`n=== mule-maven-plugin-3.8.2.pom ==="
Get-Content 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\mule\tools\maven\mule-maven-plugin\3.8.2\mule-maven-plugin-3.8.2.pom'