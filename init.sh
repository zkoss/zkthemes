#!/bin/bash

echo ""
echo "This script will assist you in setting up your custom ZK theme maven project."
echo ""

# 1. gather information

while true; do
	while true; do
		read -p "Enter the [GROUP ID] for your theme project and press [ENTER]: " groupId
		case $groupId in
			"" ) echo "[GROUP ID] cannot be empty, try again.";;
			* ) break;;
		esac
	done

	while true; do
		read -p "Enter the [ARTIFACT ID] (will also be your theme name) for your theme project and press [ENTER]: " artifactId
		case $artifactId in
			"" ) echo "[ARTIFACT ID] cannot be empty, try again.";;
			# need to check with regex, because this string will be used in folder path
			*[[:space:]]* ) echo "[ARTIFACT ID] cannot contain whitespace(s), try again.";;
			* ) break;;
		esac
	done
	
	themeName=$artifactId
	themeNameCap=$(echo $themeName | cut -c 1 | tr [a-z] [A-Z])$(echo $themeName | cut -c 2-)

	while true; do
		read -p "Enter the [VERSION] for your theme project and press [ENTER]: " version
		case $version in
			"" ) echo "[VERSION] cannot be empty, try again.";;
			* ) break;;
		esac
	done

	

	while true; do
		read -p "Enter the [DISPLAY NAME] for your theme and press [ENTER]: " displayName
		case $displayName in
			"" ) echo "[DISPLAY NAME] cannot be empty, try again.";;
			* ) break;;
		esac
	done

	echo ""
	echo "GROUP ID     : $groupId"
	echo "ARTIFACT ID  : $artifactId"
	echo "VERSION      : $version"
	echo "DISPLAY NAME : $displayName"
	echo ""

	read -p "Is the above information correct? [Y/n] " confirm
	case $confirm in
		"") break;;
		[Yy]*) break;;
		*) echo "Let's start again then."; echo "";;
	esac
done

# 2. done gathering information, update the files now

# need to update
# 1. pom.xml
# 2. version
# 3. folder path
# 4. Version.java
# 5. webAppInit.java
# 6. config.xml
# 7. lang-addon.xml

# first, check if files to be modified are present

if [ ! -e pom.xml ]; then
	echo "[pom.xml] not found, unable to proceed, abort."
	exit 2
fi
if [ ! -e version ]; then
	echo "[version] not found, unable to proceed, abort."
	exit 2
fi
fileCount=$(find . -name "Version.java" | wc -l)
if [ ! $fileCount -eq "1" ]; then
	echo "more than one [Version.java], or file not found, unable to proceed, abort."
	exit 2
fi
versionFilePath=$(find . -name "Version.java") # we now have the path to the file
oldThemePath=${versionFilePath%/Version.java} # trim the file name
oldThemeName=$(echo ${oldThemePath} | rev | cut -d / -f 1 | rev) # substring the theme name
themeWebAppInitFileCount=$(find ${oldThemePath} -name "*ThemeWebAppInit.java" | wc -l)
if [ ! $themeWebAppInitFileCount -eq "1" ]; then
	echo "more than one [ThemeWebAppInit.java], or file not found, unable to proceed, abort."
	exit 2
fi
themeWebAppInitFilePath=$(find ${oldThemePath} -name "*ThemeWebAppInit.java")
if [ ! -e src/archive/metainfo/zk/config.xml ]; then
	echo "[config.xml] not found, unable to proceed, abort."
	exit 2
fi
if [ ! -e src/archive/metainfo/zk/lang-addon.xml ]; then
	echo "[lang-addon.xml] not found, unable to proceed, abort."
	exit 2
fi
if [ ! -e readme.txt ]; then
	echo "[readme.txt] not found, proceed anyway..."
fi


# all files found, start updating

echo -n "updating pom.xml..."
sed -i.zktmp "0,/<groupId>.*<\/groupId>/s//<groupId>${groupId}<\/groupId>/" pom.xml
echo -n "...."
sed -i.zktmp "0,/<artifactId>.*<\/artifactId>/s//<artifactId>${artifactId}<\/artifactId>/" pom.xml
echo -n "...."
sed -i.zktmp "0,/<version>.*<\/version>/s//<version>${version}<\/version>/" pom.xml
echo -n "...."
sed -i.zktmp "0,/<name>.*<\/name>/s//<name>${artifactId}<\/name>/" pom.xml
echo -n "...."
sed -i.zktmp "0,/<description>.*<\/description>/s//<description>${displayName}<\/description>/" pom.xml
echo -n "..."
echo -n "done."
echo ""

echo -n "updating version..."
sed -i.zktmp "2 s/.*/${version}/" version
echo -n "..................."
echo -n "done."
echo ""

echo -n "updating Version.java..."
sed -i.zktmp "0,/package org\.zkoss\.theme\..*;/s//package org\.zkoss\.theme\.${themeName};/" ${versionFilePath}
echo -n "......."
sed -i.zktmp "0,/public static final String UID = \".*\";/s//public static final String UID = \"${version}\";/" ${versionFilePath}
echo -n "......."
echo -n "done."
echo ""

echo -n "updating ThemeWebAppInit.java..."
sed -i.zktmp "0,/\/\* .*ThemeWebAppInit\.java/s//\/\* ${themeNameCap}ThemeWebAppInit\.java/" ${themeWebAppInitFilePath}
echo -n "."
sed -i.zktmp "0,/package org\.zkoss\.theme\..*;/s//package org\.zkoss\.theme\.${themeName};/" ${themeWebAppInitFilePath}
echo -n "."
sed -i.zktmp "0,/public class .*ThemeWebAppInit implements WebAppInit {/s//public class ${themeNameCap}ThemeWebAppInit implements WebAppInit {/" ${themeWebAppInitFilePath}
echo -n "."
sed -i.zktmp "0,/private final static String THEME_NAME = \".*\";/s//private final static String THEME_NAME = \"${themeName}\";/" ${themeWebAppInitFilePath}
echo -n "."
sed -i.zktmp "0,/private final static String THEME_DISPLAY = \".*\";/s//private final static String THEME_DISPLAY = \"${displayName}\";/" ${themeWebAppInitFilePath}
echo -n "."
mv ${themeWebAppInitFilePath} ${oldThemePath}/${themeNameCap}ThemeWebAppInit.java
echo -n "."
echo -n "done."
echo ""

echo -n "updating theme path..."
mv ${oldThemePath} ${oldThemePath/${oldThemeName}/${themeName}}
echo -n "................"
echo -n "done."
echo ""

echo -n "updating config.xml..."
configXmlFile=src/archive/metainfo/zk/config.xml
sed -i.zktmp "0,/<config-name>.*<\/config-name>/s//<config-name>${themeName}<\/config-name>/" ${configXmlFile}
echo -n "...."
sed -i.zktmp "0,/<version-class>org\.zkoss\.theme\..*\.Version<\/version-class>/s//<version-class>org\.zkoss\.theme\.${themeName}\.Version<\/version-class>/" ${configXmlFile}
echo -n "...."
sed -i.zktmp "0,/<version-uid>.*<\/version-uid>/s//<version-uid>${version}<\/version-uid>/" ${configXmlFile}
echo -n "...."
sed -i.zktmp "0,/<listener-class>org\.zkoss\.theme\..*\..*ThemeWebAppInit<\/listener-class>/s//<listener-class>org\.zkoss\.theme\.${themeName}\.${themeNameCap}ThemeWebAppInit<\/listener-class>/" ${configXmlFile}
echo -n "...."
echo -n "done."
echo ""

echo -n "updating lang-addon.xml..."
langAddonXmlFile=src/archive/metainfo/zk/lang-addon.xml
sed -i.zktmp "0,/<addon-name>.*<\/addon-name>/s//<addon-name>${themeName}<\/addon-name>/g" ${langAddonXmlFile}
echo -n "...."
sed -i.zktmp "0,/<version-class>org\.zkoss\.theme\..*\.Version<\/version-class>/s//<version-class>org\.zkoss\.theme\.${themeName}\.Version<\/version-class>/" ${langAddonXmlFile}
echo -n "...."
sed -i.zktmp "0,/<version-uid>.*<\/version-uid>/s//<version-uid>${version}<\/version-uid>/" ${langAddonXmlFile}
echo -n "...."
echo -n "done."
echo ""

echo -n "updating readme.txt..."
sed -i.zktmp "0,/How to use .*\.jar:/s//How to use ${themeName}\.jar:/" readme.txt
echo -n "...."
sed -i.zktmp "0,/Put .*\.jar in WEB-INF\/lib, then .* will become/s//Put ${themeName}\.jar in WEB-INF\/lib, then ${themeName} will become/" readme.txt
echo -n "...."
sed -i.zktmp "0,/<value>.*<\/value>/s//<value>${themeName}<\/value>/" readme.txt
echo -n "...."
sed -i.zktmp "0,/zktheme=.*/s//zktheme=${themeName}/" readme.txt
echo -n "...."
echo -n "done."
echo ""

echo -n "removing zktmp files..."
find . -name "*.zktmp" | xargs rm -f
echo -n "..............."
echo -n "done."
echo ""

echo "All done."
exit 1

if [ "$OS" = "Windows_NT" ]; then # to avoid tons of if/else with uname -s in Windows
	OS_detected="Windows"
else
	OS_detected=$(uname -s 2>/dev/null || echo not)
fi

case "$OS_detected" in
	Darwin)
		echo 'mac'
	;;
	
	Linux)
		echo 'linux'
	;;

	Windows)
		echo 'windows'
	;;

	*)
		echo 'other OS'
	;;
esac
