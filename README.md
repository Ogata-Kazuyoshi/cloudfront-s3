# AWS-cloudFront

<details open="open">
<summary>目次</summary>


- [今回のシステム概要図](#今回のシステム概要図)
- [作業手順](#作業手順)
- [備考](#備考)
- [参考](#参考)
</details>

# 今回のシステム概要図
<details>
<summary> システム概要図</summary>


</details>

# 作業手順

<details>
<summary> 1. cloudformation-baseをデプロイ</summary>

- リージョンの設定と、アクセスキーの情報だけ環境変数で必要
- ぶっちゃけVPC使わないので、このデプロイはなくて良い。CloudFrontはグローバルでVPCに依存しない

```zh
export AWS_DEFAULT_REGION=ap-northeast-1
```

</details>

<details>
<summary> 2. 各種環境変数を設定</summary>

- 実行ターミナルに下記の環境変数を設定

```zh
export AWS_DEFAULT_REGION=ap-northeast-1
export GITHUB_ACCOUNT=hogehoge
export GITHUB_REPOSITORY=hogehoge
```

</details>

<details>
<summary> 3. IAMロールの作成</summary>

- cloudformation-iam-role.ymlをデプロイ

</details>

<details>
<summary> 4. cloudformation-wafaclをデプロイ</summary>

- wafaclをcloudformationでデプロイするにはバージニア（us-east-1）じゃないとできない。
- そのため、CloudFront作成のCloudForamationとは分けて、且つMakefile実行時にリージョンを切り替えれるようにコマンドラインに --region オプションをつける

</details>

<details>
<summary> 5. 環境変数に、上記のweb-aclのarnを追加してから、cloudfrontの方をデプロイ</summary>

- 下記環境変数追加
- cloudformation-cloudfrontをデプロイ

```zh
export WAF_ACL_ARN=hogehoge

make iac-cloudfront-deploy
```

</details>


# 備考

- webaclをcloudformationから作成する際はバージニアリージョンしかだめ！！！！
- - name: Deploy to S3
    run: |
    aws s3 sync frontend/build s3://あなたのバケット名 --delete
- aws s3 syncコマンドを使用して、ビルドされたファイルをS3バケットに同期します。--deleteオプションにより、S3バケット内の古いファイルが削除されます。



# 参考
