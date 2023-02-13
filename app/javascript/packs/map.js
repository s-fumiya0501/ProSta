let map //変数の定義
let geocoder //変数の定義
function initMap(){ //コールバック関数
  console.log(gon.student.latitude)
  geocoder = new google.maps.Geocoder() //GoogleMapsAPIジオコーディングサービスにアクセス
  if(document.getElementById("map")){ //‘map’というidを取得できたら実行
    map = new google.maps.Map(document.getElementById("map"), { //‘map’というidを取得してマップを表示
      center: {lat: gon.student.latitude, lng: gon.student.longitude}, //最初に表示する場所（今回は「渋谷スクランブル交差点」が初期値）
      zoom: 15, //拡大率（1〜21まで設定可能）
    });
  }else{ //‘map’というidが無かった場合
    map = new google.maps.Map(document.getElementById("map"), { //‘show_map’というidを取得してマップを表示
      center: {lat: gon.student.latitude, lng: gon.student.longitude}, //controllerで定義した変数を緯度・経度の値とする（値はDBに入っている）
      zoom: 15, //拡大率（1〜21まで設定可能）
    });
    marker = new google.maps.Marker({ //GoogleMapにマーカーを落とす
      position:  {lat: gon.student.latitude, lng: gon.student.longitude}, //マーカーを落とす位置を決める（値はDBに入っている）
      map: map //マーカーを落とすマップを指定
    });
  }
}
window.initMap = initMap
