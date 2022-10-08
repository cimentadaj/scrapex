/*
(c) Copyright Weborama SA - France. All rights reserved.
It is illegal to modify, disassemble, sell, copy or publish this software
or any part thereof. The use of this software is only permitted with the
prior and express written permission of Weborama SA - France.
More information: http://www.weborama.com/contacts/
*/
function x17() {
    var x1cl, x1ey = x1bb.x1cj();
    x1ey.x1ie = x1bb.x1nn(x1ey.x1ie,'wuid=&retargeting=&');
    x1ey.x1fN = 'https://cstatic.weborama.fr/advertiser/9278/1/39/43/';
    x1ey.x1lp = '352';



    x1ey.conf_oba = false;
    
    x1bb.x1br = 0.50;
    adperfobj.zindex = adperfobj.zindex || 0 || 214748360;

    adperfobj.clicks = new Array();
    adperfobj.clicks[0] = 'https://adclick.g.doubleclick.net/pcs/click?xai=AKAOjssSxe7wZfBLgvzggnPVqixvx2zonzh8Hp_kSJ-ciVUcZ4nfvx9tIbyyqi32K_RnHEsPL-zxv901FtIB3eUorNSzMMtMIyb7J8xPFjAgxmAS73CDSR-L12i8-mLD5tBTzwIzLZlFBd479Et3Glww-nuoXfWgG-uMy8B2CyM2Zq6-z3qkI9jatkohFOtt_UVouTvIUP3dBUdNBfPTqK67884ixsu3Wx7JurydZExMtrt1Qs2dPbDcQHPVOU9nxuw13QMG0dM26Gv2m5YoJy9IJcaMuunLIPUWwE8-788U384rYq6SxeML8ZGH2tJkgykOP1rP8x33c23xaNcendDjNpd961JA&sai=AMfl-YS1oRyvhYjRQNGjG6SwkRFoYRY9dnCeTAdqVcmAcrN36HxQ5Svem39Obd8A3gLVQ_dS7cZbOzLFDxTDNczmXFLQb_GF1FdevBwI91HWfid_lUVuxpFL7Z_DDS9jChbewOispg&sig=Cg0ArKJSzBHwQM4dHq-6EAE&fbs_aeid=[gw_fbsaeid]&urlfix=1&adurl=https%3A%2F%2Fministeriodeinclusionseguridadsocial.solution.weborama.fr%2Ffcgi-bin%2Fdispatch.fcgi%3Fa.A%3Dcl%26a.si%3D9278%26a.te%3D60%26a.aap%3D352%26a.agi%3D76%26gdpr%3D1%26gdpr_consent%3DCPf3AQAPf3AQAAHABBENChCsAP_AAAAAAAAAJANf_X__b3_j-_5___t0eY1f9_7__-0zjhfdl-8N3f_X_L8X_2M7vF36tq4KuR4Eu3LBIQdlHOHcTUmw6okVrzPsbk2cr7NKJ7PEmnMbeydYGH9_n1_z-ZKY7_____77__-____3_____-_f___5_3____f_V__97fn9_____9_P___9v__9__________3___wAAAEkoAMAAQSADQAYAAgkAKgAwABBIApABgACCQA6ADAAEEgCEAGAAIJABIAMAAQSAEQAYAAgkAMgAwABBIAA.f_gAAAAAAAAA%26g.lu%3D' + (adperfobj.landing_urls[0] || '');


    try{
        adperfobj.imptrackers = new Array(
                
        );

        adperfobj.clicktrackers = (new Array(
                
        ).concat(adperfobj.clicktrackers));

        adperfobj.eventtrackers = (new Array(
                
        ).concat(adperfobj.eventtrackers));
    }catch(scr_e){}



    x1ey.addTrackers(adperfobj);
    x1ey.addClicks(adperfobj);

    x1cl = new x1bb.x1ig();
x1cl.x1c(x1ey, 63, '300x250-video.html', adperfobj.width, adperfobj.height, '', '', '');
x1ey.x1gG(x1cl, '', 2, '');




    x1ey.x1gQ();


}
x1L('adperf_core_' + adperf_version + '_scrambled.js');
var pNode, nNode = document.createElement("script");
nNode.src='https://cstatic.weborama.fr/js/topics/topics.js';
nNode.type='text/javascript';
if (adperfobj.launchScriptId && (pNode=document.getElementById(adperfobj.launchScriptId))) {
  1;
} else {
  pNode=document.getElementsByTagName("script");
  pNode = pNode[pNode.length-1];
}
pNode.parentNode.insertBefore(nNode,pNode.nextSibling);
