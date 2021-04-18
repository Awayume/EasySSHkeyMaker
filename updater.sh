#!/bin/sh

# 新バージョンの案内
echo Ver2.1
echo 
# アップデート開始文
echo アップデートをスタートします。Enterを押してください。
read Wait
# 旧バージョンの削除
cd $home
rm maker.sh
# 新バージョンのダウンロード
wget https://github.com/Awayume/EasySSHkeyMaker/releases/download/v2.1/maker.sh
chmod 755 maker.sh
echo アップデートが完了しました。ツールを起動します。
echo Enterを押してください。
read Wait
./maker.sh
