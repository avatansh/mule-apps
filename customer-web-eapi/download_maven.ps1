$mavenDir = "C:\Users\avatansh.sharma\apache-maven-3.8.8"
$mavenZip = "$env:TEMP\apache-maven-3.8.8-bin.zip"

if (!(Test-Path $mavenDir)) {
    Write-Host "Downloading Apache Maven 3.8.8..."
    Invoke-WebRequest -Uri "https://archive.apache.org/dist/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.zip" -OutFile $mavenZip
    Write-Host "Extracting..."
    Expand-Archive -Path $mavenZip -DestinationPath "C:\Users\avatansh.sharma\" -Force
    Write-Host "Maven 3.8.8 ready at: $mavenDir"
} else {
    Write-Host "Maven 3.8.8 already exists at: $mavenDir"
}

# Verify
$mvnBin = "$mavenDir\bin\mvn.cmd"
if (Test-Path $mvnBin) {
    Write-Host "Maven binary found: $mvnBin"
} else {
    Write-Host "ERROR: Maven binary not found at $mvnBin"
}