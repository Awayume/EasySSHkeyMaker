#!/bin/sh

# 起動時の処理
echo SSHキーを作成するために必要なパッケージをインストールします。
echo 途中でインストールするか聞かれるので、yを入力してEnterを押してください。
cd $home
pkg install openssh
pkg install vim
# 説明
echo SSHキーを作成します。
echo 既に作成している場合、上書きされるので注意してください。
echo 最初に、作成するディレクトリを聞かれますが、そのままEnterを押してください。
echo 次に、パスワードを設定するか聞かれます。パスワードは設定推奨ですが、設定しないことも可能です。
echo 作成しない場合、そのままEnterを2回押してください。
echo 作成する場合、確実に覚えられるパスワードを入力してEnterを押してください。
echo すると、パスワードの確認として、もう一度入力を求められるので、同じように入力してEnterを押してください。
echo なお、パスワードは入力しても表示されませんが、ちゃんと入力されているので安心してください。
echo @@@@@@@@@@@@@@@
echo @作成を開始します@
echo @@@@@@@@@@@@@@@
echo GitHubのユーザー名を入力してください。
read USERNAME
echo SSHキーの作成に使用する、GitHubに登録したメールアドレスを入力してください。
read MAILADDRES
ssh-keygen -t rsa -b 4096 -C "$MAILADDRES"
echo SSHキーの作成が完了しました。
at ~/.ssh/id_rsa.pub
echo 公開鍵の内容を表示しています。
echo クリップボードにコピーして、GitHubのSSHキーの設定画面にペーストしてください。
echo なお、タイトルには何を入力しても構いません。
echo Enterキーを押してください。GitHubへ遷移します。
echo なお、この後SSHキーの設定を行うため、Termuxは閉じないでください。
read Wait
xdg-open https://github.com/settings/ssh/new
echo 待機しています。Enterを押してください。
read Wait
echo @@@@@@@@@@@@@@@@@@@@@@@@@
echo @SSHキーの設定を開始します。@
echo @@@@@@@@@@@@@@@@@@@@@@@@@
echo 矢印で囲われている内容を、クリップボードにコピーしてください。
echo ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
echo Host github
echo User git
echo Hostname github.com
echo Port 22
echo IdentityFile ~/.ssh/id_rsa
echo ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
echo クリップボードにコピーした内容を、次に出てくる画面にペーストしてください。
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @[重要]次の画面で入力したら、左下のEscをタップ→:wqと入力してください。@
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo Enterを押してください。
read Wait
vim ~/.ssh/config
echo 待機しています。Enterを押してください。
read Wait
echo SSHキーの設定をしています...
chmod 700 ~/.ssh
chmod 600 id_rsa
ssh-add ~/.ssh/id_rsa
git remote -v
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
echo 設定が完了しました。
echo 全ての処理が完了しました。
