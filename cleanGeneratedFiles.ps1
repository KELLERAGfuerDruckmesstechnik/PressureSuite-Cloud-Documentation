function Delete-StaticPagesOfSubDirs {
	param( $Path)
	cd $Path
	Get-ChildItem -Path .\public -Include * | remove-Item -recurse
	cd..
}

$srcRoot = Get-Location
$siteName = "docs.kolibricloud.ch"
$destinationSubDirectoryName = "wwwroot"

Get-ChildItem -Path .\$destinationSubDirectoryName -Include * | remove-Item -recurse
Get-ChildItem -Path .\docs.kolibricloud.ch\public -Include * | remove-Item -recurse

Delete-StaticPagesOfSubDirs docs.kolibricloud.ch.keller-devices
Delete-StaticPagesOfSubDirs docs.kolibricloud.ch.cloud-interfaces
Delete-StaticPagesOfSubDirs docs.kolibricloud.ch.sending-technology
Delete-StaticPagesOfSubDirs docs.kolibricloud.ch.faq
Delete-StaticPagesOfSubDirs docs.kolibricloud.ch