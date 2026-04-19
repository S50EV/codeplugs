# Select-String -Path ".\user.csv" -Pattern "^293" | Select-Object Line | Export-Csv -path "./s5contacts.csv " -NoTypeInformation

Select-String -Path "./users.csv" -Pattern "^293" | ForEach-Object {
    # Split the line 
    $Elements = $_.Line.Split(",", [System.StringSplitOptions]::RemoveEmptyEntries)
    # Construct the string: (Element 0 , Element 1)
    "$($Elements[0]);$($Elements[1]) $($Elements[2])"
} | Out-File -FilePath "./contacts.csv" -Encoding utf8
