# echo " update file ..."
QRText="https://www.baidu.com"
# 草料二维码API
curl https://cli.im/api/qrcode/code?text=${QRText} > ./qrcode.text
url=$(cat ./qrcode.text | grep qrcode_plugins_img | awk -F ';' '{print $1}' | awk -F ' ' '{print $3}' | awk -F '"' '{print $2}' | awk -F 'qrcode_plugins' '{print $1}' )
url="https:${url}"
echo $url



