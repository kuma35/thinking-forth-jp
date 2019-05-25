# generate PNG image files from fig*.tex files

1. check fig*.tex fin thinking-forth-1.0 folder.
2. fig* location in *.tex.
3. fig* location in thiking-forth.pdf. get page number.
4. run InkScape
5. import thinking-forth.pdf and set page number and Choice popper/Cario import.
6. ungroup all and re-group fig.
7. export PNG , selected area only.
8. PNG file name is tex-fig*.png

# JP: fig?-?.texをPNG画像に変換する手順

1. 変換対象のfig?-?.texファイル達は thinking-forth-1.0 フォルダ参照。
2. 変換対象のfig?-?がどの辺りで呼び出されているか調べる。

    ```
    $ grep -n fig1-3 *.tex
    ```
    当該のファイルをエディタ等で開き文章のどの辺りで呼び出されているか確認(\wtexfig??)。

3. 当該のfigがthinking-forth.pdfの何ページにあるか確認する。
4. InkScapeを実行する。
5. インポートでPDFファイルのthinking-forth.pdfを開き、ページを指定し、オプションの popper/Cario importを選択。
6. 全体をグループ化解除し、figの部分だけ選択してグループ化する。
7. PNG画像としてエクスポートで「選択範囲」タブ、「選択されてないものは出力しない」にチェック。
8. ファイル名は tex-fig?-?.png として、「エクスポート」ボタン押下でエクスポート実行。
