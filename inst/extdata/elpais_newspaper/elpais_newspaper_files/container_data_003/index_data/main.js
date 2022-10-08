
	var contador=1;
	var tl_master;
	var elemSalida;

function init(){

	elemSalida = ['#logos'];
	elemFrame2 = ['#txt1a','#txt1b','#txt2','#txt3','#txt4','#ico1','#ico2','#ico3','#ico4','#cta','#linea'];
	gsap.set('#linea', { opacity:1, transformOrigin:'center center'});	
	startAnimation();
};

function startAnimation(){

	tl_master = gsap.timeline({repeat:3, repatDelay:.3,defaults:{duration: .5 , ease: "quad.out"}});

	tl_master.addLabel( "ini","+=.3");
	tl_master.fromTo(['#txt1a','#txt1b'],{x:"-=3", opacity:0},{x: 0, opacity:1,rotation: 0.01,stagger:.8 }, "ini" );
	
	tl_master.addLabel( "frame1","+=1");
	tl_master.fromTo("#txt2",{x:"-=3", opacity:0},{x: 0, opacity:1,rotation: 0.01 }, "frame1" );
	
	tl_master.addLabel( "frame2","+=2.5");
	tl_master.to("#foto",{ x:0,opacity:0,rotation: 0.01 }, "frame2");
	tl_master.fromTo("#txt3",{x:"-=3", opacity:0},{x: 0, opacity:1,rotation: 0.01 }, "frame2+=.4" );
	tl_master.addLabel( "frame3","+=.5");
	tl_master.to('#linea',{width:"87px",duration: .8}, "frame3" );
	tl_master.fromTo("#txt4",{x:"-=3", opacity:0},{x: 0, opacity:1,rotation: 0.01 }, "frame3+=.5" );
	tl_master.to(['#ico1','#ico2','#ico3','#ico4'],{opacity:1,stagger:1,duration: .8}, "frame3+=1" );

	tl_master.addLabel( "frame4","+=2");
	tl_master.to(elemFrame2,{ opacity:0}, "frame4");
	tl_master.to('#logos',{ opacity:1}, "frame4+=.5");

	tl_master.addLabel( "parada");
	tl_master.call(parada, null, "parada+=4");

	tl_master.addLabel( "salida" ,"+=.3");
	tl_master.to(elemSalida,{duration: .5, x:0,opacity:0,rotation: 0.01 }, "salida");
	tl_master.to(["#txt1","#foto","#cta"],{x: 0, opacity:1,rotation: 0.01,duration:1 }, "salida+=.5" );

	
}
function parada(){

    if(contador === 2){
		tl_master.pause();
		tl_ctaFlecha.pause();
	}
    else{
		contador++;	
    }        
};


