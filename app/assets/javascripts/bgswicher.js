jQuery(function($) {
    $('.bg_slider1').bgSwitcher({
        images: ['../assets/live_stage_purple.jpg','../assets/iphone_blue.jpg','../assets/colorful_stage.jpg'], // 切替背景画像を指定
	    interval: 3000, // 背景画像を切り替える間隔を指定 1000=1秒
        loop: true, // 切り替えを繰り返すか指定 true=繰り返す false=繰り返さない
        shuffle: false, // 背景画像の順番をシャッフルするか指定 true=する false=しない
        effect: "blind", // エフェクトの種類をfade,blind,clip,slide,drop,hideから指定
        duration: 500, // エフェクトの時間を指定
        easing: "swing" // エフェクトのイージングをlinear,swingから指定
    });
    $('.bg_slider2').bgSwitcher({
        images: ['../assets/live_studio.jpg','../assets/piano_headphone.jpg','../assets/listening_radio.jpg'], // 切替背景画像を指定
	    interval: 3000, // 背景画像を切り替える間隔を指定 1000=1秒
        loop: true, // 切り替えを繰り返すか指定 true=繰り返す false=繰り返さない
        shuffle: false, // 背景画像の順番をシャッフルするか指定 true=する false=しない
        effect: "fade", // エフェクトの種類をfade,blind,clip,slide,drop,hideから指定
        duration: 500, // エフェクトの時間を指定
        easing: "swing" // エフェクトのイージングをlinear,swingから指定
    });
    $('.bg_slider3').bgSwitcher({
        images: ['../assets/listening_girl_pink.jpg','../assets/live_singer.jpg','../assets/live_studio.jpg'], // 切替背景画像を指定
	    interval: 3000, // 背景画像を切り替える間隔を指定 1000=1秒
        loop: true, // 切り替えを繰り返すか指定 true=繰り返す false=繰り返さない
        shuffle: false, // 背景画像の順番をシャッフルするか指定 true=する false=しない
        effect: "drop", // エフェクトの種類をfade,blind,clip,slide,drop,hideから指定
        duration: 500, // エフェクトの時間を指定
        easing: "swing" // エフェクトのイージングをlinear,swingから指定
    });
});