Clear-Host
$Path = "C:\apps"
$Ext = "XANJB"

Write-Host "Scanning : " -NoNewline
$XANJB = (Get-ChildItem -Path $Path *.$Ext -Recurse).FullName
If ($XANJB)
{
    Write-Host "The files are located." -ForegroundColor Red
    foreach ($file in $XANJB)
    {
        Write-Host "Deleting file at $file " : -NoNewline
        try 
        {
            Remove-Item -Path "$file" -Force -ErrorAction Stop
            Write-Host " Done" -ForegroundColor Green
        }
        catch 
        {
            Write-Warning ($_.Exception.Message)
        }
    }
}

If (!($XANJB))
{
    Write-Host "No files are located." -ForegroundColor Green
}
