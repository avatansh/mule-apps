$pom = 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\mule\mule-maven-client-impl\1.7.0-rc3\mule-maven-client-impl-1.7.0-rc3.pom'
if (Test-Path $pom) {
    Get-Content $pom | Select-String 'aether-connector|provided|compile' -Context 3,3
} else {
    Write-Host "POM not found: $pom"
    # Try 1.6.0 as fallback
    $pom2 = 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\mule\mule-maven-client-impl\1.6.0\mule-maven-client-impl-1.6.0.pom'
    Write-Host "Checking $pom2"
    Get-Content $pom2 | Select-String 'aether-connector|provided' -Context 3,3
}