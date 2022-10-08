var adDiv;
var ctaContainer;

var loop;
loop = 0;

function startAd() {
    adDiv = document.getElementById("ad");
    ctaContainer = document.getElementById("ctaContainer");

    bannerAnim();



}


function bannerAnim(){

    
    
    var tl_bannerAnim = gsap.timeline({repeat:-1});

    tl_bannerAnim.to("#text1", 0.5,{ opacity:1, ease: Power0.easeOut});
    tl_bannerAnim.to("#icon_skytrax", 0.5,{ opacity:1, ease: Power0.easeOut},"+=0.5");
    
    tl_bannerAnim.to(["#text1","#icon_skytrax"], 0.5,{ opacity:0, ease: Power0.easeOut},"+=2");
    tl_bannerAnim.to("#text2", 0.5,{ opacity:1, ease: Power0.easeOut});
    tl_bannerAnim.to("#icon_1", 0.5,{ opacity:1, ease: Power0.easeOut});
    
    tl_bannerAnim.to(["#text2","#icon_1"], 0.5,{ opacity:0, ease: Power0.easeOut},"+=3");
    tl_bannerAnim.to("#text3", 0.5,{ opacity:1, ease: Power0.easeOut});
    
    tl_bannerAnim.to("#text3", 0.5,{ opacity:0, ease: Power0.easeOut},"+=2");
    tl_bannerAnim.to("#fondo-blanco", 0.5,{ opacity:1, ease: Power0.easeOut});
    tl_bannerAnim.to("#logo1", 0.5,{ opacity:1, ease: Power0.easeOut});
    tl_bannerAnim.to("#logo2", 0.5,{ opacity:1, ease: Power0.easeOut},"-=0.2");

    tl_bannerAnim.to(["#fondo-blanco","#logo1","#logo2"], 0.3,{ opacity:0, ease: Power0.easeOut},"+=3");


    //tl_bannerAnim2.call(loopCheck);

    

   	function loopCheck() {
        loop++;
        if (loop < 2) {
            tl_bannerAnim.play();
        } else{
            //console.log("done")
            tl_bannerAnim.pause();
           
        }
    }


}



window.addEventListener("load", startAd);