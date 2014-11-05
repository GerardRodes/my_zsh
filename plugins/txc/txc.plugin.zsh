xcodearchive() {
	current_pwd="$(pwd)"
	cd ~/Sites/dev/repo/procyon-ng/ProcyonNG
	if (( $# == 0 )); then
		xcodebuild -scheme ProcyonNG archive
	else
		xcodebuild -scheme $1 archive
	fi
        cd ~/Library/Developer/Xcode/Archives/*(/om[1])
	cd *(/om[1])
	export LAST_ARCHIVE="$(pwd)"
	cd $current_pwd
}

xcodedeploy() {
	if (( $# == 0 )); then
                xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.dev.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ Ad Hoc Profile - Developers"
		xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.bebe.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ Ad Hoc Profile - Bebeinnova"
        	xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.appstore.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ App Store Profile"
	else
                
        fi
}
