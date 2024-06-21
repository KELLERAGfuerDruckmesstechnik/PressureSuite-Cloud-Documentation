function Create-StaticPagesOfSubDirs {
	param( $Path)
	Write-Host "Build static files in  -- $Path"
	cd $Path
	Get-ChildItem -Path .\public -Include * | remove-Item -recurse
	.\Hugo --config .\config.toml
	
	if ($siteName -eq $Path) {
		#	$folderName = ($Path).Replace($siteName+".","")
		#	$folderName = ($folderName).Replace($siteName,"")
		$destPath = "$srcRoot\$destinationSubDirectoryName\"
	} else {
		$folderName = ($Path).Replace($siteName+".","")
		$destPath = "$srcRoot\$destinationSubDirectoryName\$folderName"
		mkdir $destPath
	}
	Copy-item .\public\* -destination $destPath -recurse
	cd..
}

$srcRoot = Get-Location
$siteName = "docs.pressuresuite.com"
$destinationSubDirectoryName = "wwwroot"

Get-ChildItem -Path .\$destinationSubDirectoryName -Include * | remove-Item -recurse
Get-ChildItem -Path .\docs.pressuresuite.com\public -Include * | remove-Item -recurse

Create-StaticPagesOfSubDirs docs.pressuresuite.com.sending-technology
Create-StaticPagesOfSubDirs docs.pressuresuite.com.cloud-interfaces
Create-StaticPagesOfSubDirs docs.pressuresuite.com.keller-devices
Create-StaticPagesOfSubDirs docs.pressuresuite.com.faq
Create-StaticPagesOfSubDirs docs.pressuresuite.com