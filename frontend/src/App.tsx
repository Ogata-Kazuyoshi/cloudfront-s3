import './App.css';

function App() {

  return (
    <>
        <div>cloudFrontのトライ</div>
        <div>S3バケットがちゃんと更新かかるかドキドキワクワク</div>
        <div>Assumeロールミス</div>
        <div>やば問題なく、CloudFrontも書き換えできちゃうぜ！！！</div>
        <div>え？更新されないとかそんな残念なことあるの？・・・・</div>
        <div>cacheクリアを入れた。github-ci.ymlに</div>
        <div>cloudfrontへのアクセス権限がAssumeに足りてなかったので追加した</div>
        <div>これで完璧にいけたかもしれません。やったーーーーー</div>
    </>
  );
}

export default App;
