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
$siteName = "docs.kolibricloud.ch"
$destinationSubDirectoryName = "wwwroot"

Get-ChildItem -Path .\$destinationSubDirectoryName -Include * | remove-Item -recurse
Get-ChildItem -Path .\docs.kolibricloud.ch\public -Include * | remove-Item -recurse

Create-StaticPagesOfSubDirs docs.kolibricloud.ch.sending-technology
Create-StaticPagesOfSubDirs docs.kolibricloud.ch.cloud-interfaces
Create-StaticPagesOfSubDirs docs.kolibricloud.ch.keller-devices
Create-StaticPagesOfSubDirs docs.kolibricloud.ch.faq
Create-StaticPagesOfSubDirs docs.kolibricloud.ch