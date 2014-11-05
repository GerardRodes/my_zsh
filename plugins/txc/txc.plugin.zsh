_xcodebuild() {
	xcodebuild $@
}

_xcodeclean() {
	xcodebuild -alltargets clean
}

_xcodearchive() {
	_xcodeclean
	_xcodebuild $@ archive
}

_xcoderun() {
	device="iPad-Air"
	ios="8.0"
	for x in $@; do
		case $x in
			-device)
				device_flag=1
				;;
			-ios)
				ios_flag=1
                                ;;
			*)
				if (( device_flag == 1 )); then
					device_flag=0
					device=$x
				elif (( ios_flag == 1)); then
					ios_flag=0
					ios=$x
				else
					args+=($x)
				fi
		esac
	; done
	_xcodebuild $args
	ios-sim launch build/Release-iphonesimulator/*.app(/[1]) --devicetypeid "com.apple.CoreSimulator.SimDeviceType.$device, $ios"
}

_xcodedeploy() {
	echo $@
}

_xcodehelp() {
	echo "help"
}

xcode() {
	command=$1
	shift
	case "$command" in
		build)
			_xcodebuild $@
			;;
		archive)
			_xcodearchive $@
                        ;;
		run)
                        _xcoderun $@
                        ;;
		deploy)
                        _xcodedeploy $@
                        ;;
		*)
			_xcodehelp
	esac
}

xcodedeploy() {
	if (( $# == 0 )); then
                xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.dev.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ Ad Hoc Profile - Developers"
		xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.bebe.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ Ad Hoc Profile - Bebeinnova"
        	xcodebuild -sdk iphoneos8.0 -archivePath $LAST_ARCHIVE -exportPath ./procyon.appstore.ipa -exportFormat ipa -exportArchive -exportProvisioningProfile "NubiQ App Store Profile"
	else
                
        fi
}
