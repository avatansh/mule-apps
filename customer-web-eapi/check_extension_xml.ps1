Add-Type -Assembly System.IO.Compression.FileSystem
$jar = 'C:\Users\avatansh.sharma\.m2-mule-apps\repository\org\mule\tools\maven\mule-maven-plugin\3.8.2\mule-maven-plugin-3.8.2.jar'
$zip = [System.IO.Compression.ZipFile]::OpenRead($jar)
$entry = $zip.Entries | Where-Object { $_.FullName -eq 'META-INF/maven/extension.xml' }
if ($entry) {
    $r = New-Object System.IO.StreamReader($entry.Open())
    $r.ReadToEnd()
    $r.Close()
} else {
    Write-Host 'META-INF/maven/extension.xml NOT FOUND'
    Write-Host 'All META-INF entries:'
    $zip.Entries | Where-Object { $_.FullName -like 'META-INF/*' } | ForEach-Object { $_.FullName }
}
$zip.Dispose()