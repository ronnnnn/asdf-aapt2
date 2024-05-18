#!/usr/bin/env bash

set -euo pipefail

MAVEN_REPO="https://dl.google.com/android/maven2/com/android/tools/build"
TOOL_NAME="aapt2"
TOOL_TEST="aapt2 --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
	local url xml_data versions
	url="$MAVEN_REPO/group-index.xml"
	xml_data=$(curl -s "$url")
	versions=$(echo "$xml_data" | xmllint --xpath '//aapt2/@versions' - | sed 's/versions=//' | sed 's/"//g' | sed 's/,/\n/g')
	echo "$versions"
}

extract_os() {
	local os_name
	os_name=""

	case "$(uname -s)" in
	Linux*) os_name="linux" ;;
	Darwin*) os_name="osx" ;;
	CYGWIN* | MINGW32* | MSYS* | MINGW*) os_name="windows" ;;
	*) fail "Unsupported OS: $(uname -s)" ;;
	esac

	echo "$os_name"
}

download_release() {
	local version filename os_name url
	version="$1"
	filename="$2"

	os_name=$(extract_os)
	url="$MAVEN_REPO/$TOOL_NAME/$version/$TOOL_NAME-$os_name.jar"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
