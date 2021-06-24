# INFO=`xcodebuild -list`
# echo ${INFO}

#工程名
APP_NAME="Jenkins"
#证书
CODE_SIGN_DISTRIBUTION=""
#info plist path
PRO_INFOPLIST_PATH="./${APP_NAME}/Info.plist"
echo ${PRO_INFOPLIST_PATH}

BUNDLE_SHORT_VERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleShortVersionString" "${PRO_INFOPLIST_PATH}")
echo ${BUNDLE_SHORT_VERSION}
BUNDLE_VERSION=$(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${PRO_INFOPLIST_PATH}")
echo ${BUNDLE_VERSION}
DATE=$(date "+%Y/%m/%d %H:%M:%S")
echo $DATE
IPA_NAME="${APP_NAME}_V${BUNDLE_SHORT_VERSION}_${DATE}.ipa"
echo $IPA_NAME
IPA_PATH=""

echo "\n>>>>>>> 🚀🚀🚀 clean start  <<<<<<<</n"
xcodebuild \
-target ${APP_NAME} \
-configuration "Release" clean
echo "\n>>>>>>> 🚀🚀🚀 clean end  <<<<<<<<\n"

echo "\n>>>>>>> 🚀🚀🚀 build start  <<<<<<<<\n"
xcodebuild \
-target $APP_NAME \
-sdk iphoneos \
-configuration 'Release'
echo "\n>>>>>>> 🚀🚀🚀 build end  <<<<<<<<\n"


echo "\n>>>>>>> 🚀🚀🚀 archive start  <<<<<<<<\n"
xcodebuild \

echo "\n>>>>>>> 🚀🚀🚀 archive end    <<<<<<<<\n"

echo "\n>>>>>>> 🚀🚀🚀 exportArchive start  <<<<<<<<\n"
echo "\n>>>>>>> 🚀🚀🚀 exportArchive end    <<<<<<<<\n"