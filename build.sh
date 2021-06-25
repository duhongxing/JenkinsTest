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


# xcodebuild -quiet    #只有 warn 和 error 才会输出
echo "\n>>>>>>> 🚀🚀🚀 clean start  <<<<<<<</n"
# xcodebuild \
# -target ${APP_NAME} \
# -configuration "Release" clean
echo "\n>>>>>>> 🚀🚀🚀 clean end  <<<<<<<<\n"

echo "\n>>>>>>> 🚀🚀🚀 build start  <<<<<<<<\n"
# xcodebuild \
# -target $APP_NAME \
# -sdk iphoneos \
# -configuration 'Release'
echo "\n>>>>>>> 🚀🚀🚀 build end  <<<<<<<<\n"


#//下面是集成有Cocopods的用法
# echo "🏎️🏎️ =================clean=================  🏎️🏎️ "
 
# xcodebuild clean -workspace "${APP_NAME}.xcworkspace" -scheme "${APP_NAME}"  -configuration ${development_mode} -UseModernBuildSystem=YES

# echo "🚗🚗🚗 *** 正在 编译工程 For ${development_mode} 🚗🚗🚗"

# xcworkspace=${project_path}/${APP_NAME}.xcworkspace
# echo "acrhivie xcworkspace : ${xcworkspace}"

# xcodebuild \
# archive -workspace  ${xcworkspace} \
# -scheme ${SCHEME_NAME} \
# -configuration ${development_mode} \
# -archivePath ${build_path}/${APP_NAME}.xcarchive \
# -quiet 


# security -v unlock-keychain -p "yourpassword"

# echo '🚄 ***************** 正在 打包  ***************** 🚄 '


# xcodebuild -exportArchive -archivePath ${build_path}/${APP_NAME}.xcarchive \
# -exportPath ${exportFilePath} \
# -exportOptionsPlist ${exportOptionsPlist_path} \
# -allowProvisioningUpdates \
# -quiet


# if [ -e ${exportFilePath}/${APP_NAME}.ipa ]; then
# echo "✅ *** .ipa文件已导出 ***"
# echo $exportFilePath

# else
# echo "❌ *** 创建.ipa文件失败 ***"
# exit 1
# fi

# echo '📦  *** 打包完成 ***'




echo '✅ *** 编译完成 ***'



echo "\n>>>>>>> 🚀🚀🚀 archive start  <<<<<<<<\n"
# xcodebuild \

echo "\n>>>>>>> 🚀🚀🚀 archive end    <<<<<<<<\n"

echo "\n>>>>>>> 🚀🚀🚀 exportArchive start  <<<<<<<<\n"
echo "\n>>>>>>> 🚀🚀🚀 exportArchive end    <<<<<<<<\n"


echo "🌲 ------------- Pod 操作 --------------------"

# pod update --verbose --no-repo-update

echo "🌲 ------------- Pod 完成 --------------------"

#修改 ipa 的 build 号，和 jenkins 构建号相同
BUILD_NUMBER=$(( ( RANDOM % 10 )  + 1 ))
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $BUILD_NUMBER" "${PRO_INFOPLIST_PATH}"

#取build值
echo $(/usr/libexec/PlistBuddy -c "print CFBundleVersion" "${PRO_INFOPLIST_PATH}")

# 这里默认是 login keychain，login keychain 的密码默认是用户的登录密码
# security -v unlock-keychain -p "password"

# /usr/bin/security cms -D -i 文件路径

