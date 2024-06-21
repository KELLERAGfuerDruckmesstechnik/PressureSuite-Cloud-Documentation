function Delete-StaticPagesOfSubDirs {
	param( $Path)
	cd $Path
	Get-ChildItem -Path .\public -Include * | remove-Item -recurse
	cd..
}

$srcRoot = Get-Location
$siteName = "docs.pressuresuite.com"
$destinationSubDirectoryName = "wwwroot"

Get-ChildItem -Path .\$destinationSubDirectoryName -Include * | remove-Item -recurse
Get-ChildItem -Path .\docs.pressuresuite.com\public -Include * | remove-Item -recurse

Delete-StaticPagesOfSubDirs docs.pressuresuite.com.keller-devices
Delete-StaticPagesOfSubDirs docs.pressuresuite.com.cloud-interfaces
Delete-StaticPagesOfSubDirs docs.pressuresuite.com.sending-technology
Delete-StaticPagesOfSubDirs docs.pressuresuite.com.faq
Delete-StaticPagesOfSubDirs docs.pressuresuite.com