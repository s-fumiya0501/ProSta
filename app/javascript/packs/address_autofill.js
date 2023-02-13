jQuery(document).on('turbolinks:load', function() {
  console.log("Turbolinks loaded")
  $('#student_postal_code').jpostal({
    postcode : [
      // 取得する郵便番号のテキストボックスをidで指定
      '#student_postal_code'
    ],
    address: {
      // %3 => 都道府県、 %4 => 市区町村 %5 => 町域 %6 => 番地 %7 => 名称
      "#student_prefecture_code": "%3", // # 市区町村と町域が入力される
      "#student_city"         : "%4", // # 大口事務所の番地と名称が入力される
      "#student_street"         : "%5%6%7"
    }
  });
});