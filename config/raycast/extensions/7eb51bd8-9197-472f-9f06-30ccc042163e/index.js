var mn=Object.create;var B=Object.defineProperty;var hn=Object.getOwnPropertyDescriptor;var gn=Object.getOwnPropertyNames;var Sn=Object.getPrototypeOf,yn=Object.prototype.hasOwnProperty;var Ie=e=>B(e,"__esModule",{value:!0});var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),xn=(e,t)=>{Ie(e);for(var r in t)B(e,r,{get:t[r],enumerable:!0})},bn=(e,t,r)=>{if(t&&typeof t=="object"||typeof t=="function")for(let n of gn(t))!yn.call(e,n)&&n!=="default"&&B(e,n,{get:()=>t[n],enumerable:!(r=hn(t,n))||r.enumerable});return e},O=e=>bn(Ie(B(e!=null?mn(Sn(e)):{},"default",e&&e.__esModule&&"default"in e?{get:()=>e.default,enumerable:!0}:{value:e,enumerable:!0})),e);var Ae=c((Ss,Ge)=>{Ge.exports=Te;Te.sync=vn;var Ee=require("fs");function wn(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var s=r[n].toLowerCase();if(s&&e.substr(-s.length).toLowerCase()===s)return!0}return!1}function Pe(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:wn(t,r)}function Te(e,t,r){Ee.stat(e,function(n,s){r(n,n?!1:Pe(s,e,t))})}function vn(e,t){return Pe(Ee.statSync(e),e,t)}});var Ne=c((ys,qe)=>{qe.exports=Re;Re.sync=In;var Ce=require("fs");function Re(e,t,r){Ce.stat(e,function(n,s){r(n,n?!1:Oe(s,t))})}function In(e,t){return Oe(Ce.statSync(e),t)}function Oe(e,t){return e.isFile()&&En(e,t)}function En(e,t){var r=e.mode,n=e.uid,s=e.gid,o=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),l=parseInt("010",8),d=parseInt("001",8),f=a|l,g=r&d||r&l&&s===i||r&a&&n===o||r&f&&o===0;return g}});var ke=c((bs,_e)=>{var xs=require("fs"),M;process.platform==="win32"||global.TESTING_WINDOWS?M=Ae():M=Ne();_e.exports=J;J.sync=Pn;function J(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,s){J(e,t||{},function(o,i){o?s(o):n(i)})})}M(e,t||{},function(n,s){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,s=!1),r(n,s)})}function Pn(e,t){try{return M.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var Ue=c((ws,Fe)=>{var I=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",$e=require("path"),Tn=I?";":":",Le=ke(),je=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),Be=(e,t)=>{let r=t.colon||Tn,n=e.match(/\//)||I&&e.match(/\\/)?[""]:[...I?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],s=I?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",o=I?s.split(r):[""];return I&&e.indexOf(".")!==-1&&o[0]!==""&&o.unshift(""),{pathEnv:n,pathExt:o,pathExtExe:s}},Me=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:s,pathExtExe:o}=Be(e,t),i=[],a=d=>new Promise((f,g)=>{if(d===n.length)return t.all&&i.length?f(i):g(je(e));let m=n[d],S=/^".*"$/.test(m)?m.slice(1,-1):m,y=$e.join(S,e),x=!S&&/^\.[\\\/]/.test(e)?e.slice(0,2)+y:y;f(l(x,d,0))}),l=(d,f,g)=>new Promise((m,S)=>{if(g===s.length)return m(a(f+1));let y=s[g];Le(d+y,{pathExt:o},(x,v)=>{if(!x&&v)if(t.all)i.push(d+y);else return m(d+y);return m(l(d,f,g+1))})});return r?a(0).then(d=>r(null,d),r):a(0)},Gn=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:s}=Be(e,t),o=[];for(let i=0;i<r.length;i++){let a=r[i],l=/^".*"$/.test(a)?a.slice(1,-1):a,d=$e.join(l,e),f=!l&&/^\.[\\\/]/.test(e)?e.slice(0,2)+d:d;for(let g=0;g<n.length;g++){let m=f+n[g];try{if(Le.sync(m,{pathExt:s}))if(t.all)o.push(m);else return m}catch{}}}if(t.all&&o.length)return o;if(t.nothrow)return null;throw je(e)};Fe.exports=Me;Me.sync=Gn});var te=c((vs,ee)=>{"use strict";var De=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};ee.exports=De;ee.exports.default=De});var We=c((Is,Ke)=>{"use strict";var Xe=require("path"),An=Ue(),Cn=te();function He(e,t){let r=e.options.env||process.env,n=process.cwd(),s=e.options.cwd!=null,o=s&&process.chdir!==void 0&&!process.chdir.disabled;if(o)try{process.chdir(e.options.cwd)}catch{}let i;try{i=An.sync(e.command,{path:r[Cn({env:r})],pathExt:t?Xe.delimiter:void 0})}catch{}finally{o&&process.chdir(n)}return i&&(i=Xe.resolve(s?e.options.cwd:"",i)),i}function Rn(e){return He(e)||He(e,!0)}Ke.exports=Rn});var Ve=c((Es,re)=>{"use strict";var ne=/([()\][%!^"`<>&|;, *?])/g;function On(e){return e=e.replace(ne,"^$1"),e}function qn(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(ne,"^$1"),t&&(e=e.replace(ne,"^$1")),e}re.exports.command=On;re.exports.argument=qn});var Ye=c((Ps,ze)=>{"use strict";ze.exports=/^#!(.*)/});var Ze=c((Ts,Qe)=>{"use strict";var Nn=Ye();Qe.exports=(e="")=>{let t=e.match(Nn);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),s=r.split("/").pop();return s==="env"?n:n?`${s} ${n}`:s}});var et=c((Gs,Je)=>{"use strict";var se=require("fs"),_n=Ze();function kn(e){let t=150,r=Buffer.alloc(t),n;try{n=se.openSync(e,"r"),se.readSync(n,r,0,t,0),se.closeSync(n)}catch{}return _n(r.toString())}Je.exports=kn});var st=c((As,rt)=>{"use strict";var $n=require("path"),tt=We(),nt=Ve(),Ln=et(),jn=process.platform==="win32",Bn=/\.(?:com|exe)$/i,Mn=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Fn(e){e.file=tt(e);let t=e.file&&Ln(e.file);return t?(e.args.unshift(e.file),e.command=t,tt(e)):e.file}function Un(e){if(!jn)return e;let t=Fn(e),r=!Bn.test(t);if(e.options.forceShell||r){let n=Mn.test(t);e.command=$n.normalize(e.command),e.command=nt.command(e.command),e.args=e.args.map(o=>nt.argument(o,n));let s=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${s}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Dn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:Un(n)}rt.exports=Dn});var at=c((Cs,it)=>{"use strict";var oe=process.platform==="win32";function ie(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Xn(e,t){if(!oe)return;let r=e.emit;e.emit=function(n,s){if(n==="exit"){let o=ot(s,t,"spawn");if(o)return r.call(e,"error",o)}return r.apply(e,arguments)}}function ot(e,t){return oe&&e===1&&!t.file?ie(t.original,"spawn"):null}function Hn(e,t){return oe&&e===1&&!t.file?ie(t.original,"spawnSync"):null}it.exports={hookChildProcess:Xn,verifyENOENT:ot,verifyENOENTSync:Hn,notFoundError:ie}});var lt=c((Rs,E)=>{"use strict";var ct=require("child_process"),ae=st(),ce=at();function ut(e,t,r){let n=ae(e,t,r),s=ct.spawn(n.command,n.args,n.options);return ce.hookChildProcess(s,n),s}function Kn(e,t,r){let n=ae(e,t,r),s=ct.spawnSync(n.command,n.args,n.options);return s.error=s.error||ce.verifyENOENTSync(s.status,n),s}E.exports=ut;E.exports.spawn=ut;E.exports.sync=Kn;E.exports._parse=ae;E.exports._enoent=ce});var ft=c((Os,dt)=>{"use strict";dt.exports=e=>{let t=typeof e=="string"?`
`:`
`.charCodeAt(),r=typeof e=="string"?"\r":"\r".charCodeAt();return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var ht=c((qs,N)=>{"use strict";var q=require("path"),pt=te(),mt=e=>{e={cwd:process.cwd(),path:process.env[pt()],execPath:process.execPath,...e};let t,r=q.resolve(e.cwd),n=[];for(;t!==r;)n.push(q.join(r,"node_modules/.bin")),t=r,r=q.resolve(r,"..");let s=q.resolve(e.cwd,e.execPath,"..");return n.push(s),n.concat(e.path).join(q.delimiter)};N.exports=mt;N.exports.default=mt;N.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=pt({env:t});return e.path=t[r],t[r]=N.exports(e),t}});var St=c((Ns,ue)=>{"use strict";var gt=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};ue.exports=gt;ue.exports.default=gt});var xt=c((_s,U)=>{"use strict";var Wn=St(),F=new WeakMap,yt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,s=e.displayName||e.name||"<anonymous>",o=function(...i){if(F.set(o,++n),n===1)r=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${s}\` can only be called once`);return r};return Wn(o,e),F.set(o,n),o};U.exports=yt;U.exports.default=yt;U.exports.callCount=e=>{if(!F.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return F.get(e)}});var bt=c(D=>{"use strict";Object.defineProperty(D,"__esModule",{value:!0});D.SIGNALS=void 0;var Vn=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];D.SIGNALS=Vn});var le=c(P=>{"use strict";Object.defineProperty(P,"__esModule",{value:!0});P.SIGRTMAX=P.getRealtimeSignals=void 0;var zn=function(){let e=vt-wt+1;return Array.from({length:e},Yn)};P.getRealtimeSignals=zn;var Yn=function(e,t){return{name:`SIGRT${t+1}`,number:wt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},wt=34,vt=64;P.SIGRTMAX=vt});var It=c(X=>{"use strict";Object.defineProperty(X,"__esModule",{value:!0});X.getSignals=void 0;var Qn=require("os"),Zn=bt(),Jn=le(),er=function(){let e=(0,Jn.getRealtimeSignals)();return[...Zn.SIGNALS,...e].map(tr)};X.getSignals=er;var tr=function({name:e,number:t,description:r,action:n,forced:s=!1,standard:o}){let{signals:{[e]:i}}=Qn.constants,a=i!==void 0;return{name:e,number:a?i:t,description:r,supported:a,action:n,forced:s,standard:o}}});var Pt=c(T=>{"use strict";Object.defineProperty(T,"__esModule",{value:!0});T.signalsByNumber=T.signalsByName=void 0;var nr=require("os"),Et=It(),rr=le(),sr=function(){return(0,Et.getSignals)().reduce(or,{})},or=function(e,{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}}},ir=sr();T.signalsByName=ir;var ar=function(){let e=(0,Et.getSignals)(),t=rr.SIGRTMAX+1,r=Array.from({length:t},(n,s)=>cr(s,e));return Object.assign({},...r)},cr=function(e,t){let r=ur(e,t);if(r===void 0)return{};let{name:n,description:s,supported:o,action:i,forced:a,standard:l}=r;return{[e]:{name:n,number:e,description:s,supported:o,action:i,forced:a,standard:l}}},ur=function(e,t){let r=t.find(({name:n})=>nr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},lr=ar();T.signalsByNumber=lr});var Gt=c((Bs,Tt)=>{"use strict";var{signalsByName:dr}=Pt(),fr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:s,exitCode:o,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${s})`:o!==void 0?`failed with exit code ${o}`:"failed",pr=({stdout:e,stderr:t,all:r,error:n,signal:s,exitCode:o,command:i,escapedCommand:a,timedOut:l,isCanceled:d,killed:f,parsed:{options:{timeout:g}}})=>{o=o===null?void 0:o,s=s===null?void 0:s;let m=s===void 0?void 0:dr[s].description,S=n&&n.code,x=`Command ${fr({timedOut:l,timeout:g,errorCode:S,signal:s,signalDescription:m,exitCode:o,isCanceled:d})}: ${i}`,v=Object.prototype.toString.call(n)==="[object Error]",L=v?`${x}
${n.message}`:x,j=[L,t,e].filter(Boolean).join(`
`);return v?(n.originalMessage=n.message,n.message=j):n=new Error(j),n.shortMessage=L,n.command=i,n.escapedCommand=a,n.exitCode=o,n.signal=s,n.signalDescription=m,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=Boolean(l),n.isCanceled=d,n.killed=f&&!l,n};Tt.exports=pr});var Ct=c((Ms,de)=>{"use strict";var H=["stdin","stdout","stderr"],mr=e=>H.some(t=>e[t]!==void 0),At=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return H.map(n=>e[n]);if(mr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${H.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,H.length);return Array.from({length:r},(n,s)=>t[s])};de.exports=At;de.exports.node=e=>{let t=At(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Rt=c((Fs,K)=>{K.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&K.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&K.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var kt=c((Us,C)=>{var u=global.process;typeof u!="object"||!u?C.exports=function(){}:(Ot=require("assert"),G=Rt(),qt=/^win/i.test(u.platform),_=require("events"),typeof _!="function"&&(_=_.EventEmitter),u.__signal_exit_emitter__?p=u.__signal_exit_emitter__:(p=u.__signal_exit_emitter__=new _,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),C.exports=function(e,t){if(global.process===u){Ot.equal(typeof e,"function","a callback must be provided for exit handler"),A===!1&&fe();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&W()};return p.on(r,e),n}},W=function(){!A||global.process!==u||(A=!1,G.forEach(function(t){try{u.removeListener(t,V[t])}catch{}}),u.emit=z,u.reallyExit=pe,p.count-=1)},C.exports.unload=W,w=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},V={},G.forEach(function(e){V[e]=function(){if(u===global.process){var r=u.listeners(e);r.length===p.count&&(W(),w("exit",null,e),w("afterexit",null,e),qt&&e==="SIGHUP"&&(e="SIGINT"),u.kill(u.pid,e))}}}),C.exports.signals=function(){return G},A=!1,fe=function(){A||u!==global.process||(A=!0,p.count+=1,G=G.filter(function(t){try{return u.on(t,V[t]),!0}catch{return!1}}),u.emit=_t,u.reallyExit=Nt)},C.exports.load=fe,pe=u.reallyExit,Nt=function(t){u===global.process&&(u.exitCode=t||0,w("exit",u.exitCode,null),w("afterexit",u.exitCode,null),pe.call(u,u.exitCode))},z=u.emit,_t=function(t,r){if(t==="exit"&&u===global.process){r!==void 0&&(u.exitCode=r);var n=z.apply(this,arguments);return w("exit",u.exitCode,null),w("afterexit",u.exitCode,null),n}else return z.apply(this,arguments)});var Ot,G,qt,_,p,W,w,V,A,fe,pe,Nt,z,_t});var Lt=c((Ds,$t)=>{"use strict";var hr=require("os"),gr=kt(),Sr=1e3*5,yr=(e,t="SIGTERM",r={})=>{let n=e(t);return xr(e,t,r,n),n},xr=(e,t,r,n)=>{if(!br(t,r,n))return;let s=vr(r),o=setTimeout(()=>{e("SIGKILL")},s);o.unref&&o.unref()},br=(e,{forceKillAfterTimeout:t},r)=>wr(e)&&t!==!1&&r,wr=e=>e===hr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",vr=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return Sr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Ir=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Er=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Pr=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let s,o=new Promise((a,l)=>{s=setTimeout(()=>{Er(e,r,l)},t)}),i=n.finally(()=>{clearTimeout(s)});return Promise.race([o,i])},Tr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Gr=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let s=gr(()=>{e.kill()});return n.finally(()=>{s()})};$t.exports={spawnedKill:yr,spawnedCancel:Ir,setupTimeout:Pr,validateTimeout:Tr,setExitHandler:Gr}});var Bt=c((Xs,jt)=>{"use strict";var b=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";b.writable=e=>b(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";b.readable=e=>b(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";b.duplex=e=>b.writable(e)&&b.readable(e);b.transform=e=>b.duplex(e)&&typeof e._transform=="function";jt.exports=b});var Ft=c((Hs,Mt)=>{"use strict";var{PassThrough:Ar}=require("stream");Mt.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",s=!1;t?s=!(r||n):r=r||"utf8",n&&(r=null);let o=new Ar({objectMode:s});r&&o.setEncoding(r);let i=0,a=[];return o.on("data",l=>{a.push(l),s?i=a.length:i+=l.length}),o.getBufferedValue=()=>t?a:n?Buffer.concat(a,i):a.join(""),o.getBufferedLength=()=>i,o}});var Ut=c((Ks,k)=>{"use strict";var{constants:Cr}=require("buffer"),Rr=require("stream"),{promisify:Or}=require("util"),qr=Ft(),Nr=Or(Rr.pipeline),me=class extends Error{constructor(){super("maxBuffer exceeded");this.name="MaxBufferError"}};async function he(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=qr(t);return await new Promise((s,o)=>{let i=a=>{a&&n.getBufferedLength()<=Cr.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),o(a)};(async()=>{try{await Nr(e,n),s()}catch(a){i(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&i(new me)})}),n.getBufferedValue()}k.exports=he;k.exports.buffer=(e,t)=>he(e,{...t,encoding:"buffer"});k.exports.array=(e,t)=>he(e,{...t,array:!0});k.exports.MaxBufferError=me});var Xt=c((Ws,Dt)=>{"use strict";var{PassThrough:_r}=require("stream");Dt.exports=function(){var e=[],t=new _r({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",s),Array.prototype.slice.call(arguments).forEach(r),t;function r(o){return Array.isArray(o)?(o.forEach(r),this):(e.push(o),o.once("end",s.bind(null,o)),o.once("error",t.emit.bind(t,"error")),o.pipe(t,{end:!1}),this)}function n(){return e.length==0}function s(o){e=e.filter(function(i){return i!==o}),!e.length&&t.readable&&t.end()}}});var Vt=c((Vs,Wt)=>{"use strict";var Ht=Bt(),Kt=Ut(),kr=Xt(),$r=(e,t)=>{t===void 0||e.stdin===void 0||(Ht(t)?t.pipe(e.stdin):e.stdin.end(t))},Lr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=kr();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},ge=async(e,t)=>{if(!!e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},Se=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?Kt(e,{encoding:t,maxBuffer:n}):Kt.buffer(e,{maxBuffer:n})},jr=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:s,maxBuffer:o},i)=>{let a=Se(e,{encoding:n,buffer:s,maxBuffer:o}),l=Se(t,{encoding:n,buffer:s,maxBuffer:o}),d=Se(r,{encoding:n,buffer:s,maxBuffer:o*2});try{return await Promise.all([i,a,l,d])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},ge(e,a),ge(t,l),ge(r,d)])}},Br=({input:e})=>{if(Ht(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Wt.exports={handleInput:$r,makeAllStream:Lr,getSpawnedResult:jr,validateInputSync:Br}});var Yt=c((zs,zt)=>{"use strict";var Mr=(async()=>{})().constructor.prototype,Fr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(Mr,e)]),Ur=(e,t)=>{for(let[r,n]of Fr){let s=typeof t=="function"?(...o)=>Reflect.apply(n.value,t(),o):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:s})}return e},Dr=e=>new Promise((t,r)=>{e.on("exit",(n,s)=>{t({exitCode:n,signal:s})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});zt.exports={mergePromise:Ur,getSpawnedPromise:Dr}});var Jt=c((Ys,Zt)=>{"use strict";var Qt=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Xr=/^[\w.-]+$/,Hr=/"/g,Kr=e=>typeof e!="string"||Xr.test(e)?e:`"${e.replace(Hr,'\\"')}"`,Wr=(e,t)=>Qt(e,t).join(" "),Vr=(e,t)=>Qt(e,t).map(r=>Kr(r)).join(" "),zr=/ +/g,Yr=e=>{let t=[];for(let r of e.trim().split(zr)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};Zt.exports={joinCommand:Wr,getEscapedCommand:Vr,parseCommand:Yr}});var an=c((Qs,R)=>{"use strict";var Qr=require("path"),ye=require("child_process"),Zr=lt(),Jr=ft(),es=ht(),ts=xt(),Y=Gt(),en=Ct(),{spawnedKill:ns,spawnedCancel:rs,setupTimeout:ss,validateTimeout:os,setExitHandler:is}=Lt(),{handleInput:as,getSpawnedResult:cs,makeAllStream:us,validateInputSync:ls}=Vt(),{mergePromise:tn,getSpawnedPromise:ds}=Yt(),{joinCommand:nn,parseCommand:rn,getEscapedCommand:sn}=Jt(),fs=1e3*1e3*100,ps=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:s})=>{let o=t?{...process.env,...e}:e;return r?es.env({env:o,cwd:n,execPath:s}):o},on=(e,t,r={})=>{let n=Zr._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:fs,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=ps(r),r.stdio=en(r),process.platform==="win32"&&Qr.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},$=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?Jr(t):t,Q=(e,t,r)=>{let n=on(e,t,r),s=nn(e,t),o=sn(e,t);os(n.options);let i;try{i=ye.spawn(n.file,n.args,n.options)}catch(S){let y=new ye.ChildProcess,x=Promise.reject(Y({error:S,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return tn(y,x)}let a=ds(i),l=ss(i,n.options,a),d=is(i,n.options,l),f={isCanceled:!1};i.kill=ns.bind(null,i.kill.bind(i)),i.cancel=rs.bind(null,i,f);let m=ts(async()=>{let[{error:S,exitCode:y,signal:x,timedOut:v},L,j,pn]=await cs(i,n.options,d),xe=$(n.options,L),be=$(n.options,j),we=$(n.options,pn);if(S||y!==0||x!==null){let ve=Y({error:S,exitCode:y,signal:x,stdout:xe,stderr:be,all:we,command:s,escapedCommand:o,parsed:n,timedOut:v,isCanceled:f.isCanceled,killed:i.killed});if(!n.options.reject)return ve;throw ve}return{command:s,escapedCommand:o,exitCode:0,stdout:xe,stderr:be,all:we,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return as(i,n.options.input),i.all=us(i,n.options),tn(i,m)};R.exports=Q;R.exports.sync=(e,t,r)=>{let n=on(e,t,r),s=nn(e,t),o=sn(e,t);ls(n.options);let i;try{i=ye.spawnSync(n.file,n.args,n.options)}catch(d){throw Y({error:d,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=$(n.options,i.stdout,i.error),l=$(n.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let d=Y({stdout:a,stderr:l,error:i.error,signal:i.signal,exitCode:i.status,command:s,escapedCommand:o,parsed:n,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!n.options.reject)return d;throw d}return{command:s,escapedCommand:o,exitCode:0,stdout:a,stderr:l,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};R.exports.command=(e,t)=>{let[r,...n]=rn(e);return Q(r,n,t)};R.exports.commandSync=(e,t)=>{let[r,...n]=rn(e);return Q.sync(r,n,t)};R.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=en.node(r),s=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:o=process.execPath,nodeOptions:i=s}=r;return Q(o,[...i,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});xn(exports,{default:()=>fn});var h=O(require("@raycast/api")),Z=O(require("react"));var cn=O(require("node:process")),un=O(an());async function ln(e){if(cn.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,un.default)("osascript",["-e",e]);return t}var dn=O(require("child_process"));function fn(){let[e,t]=(0,Z.useState)([]);return(0,Z.useEffect)(()=>{async function r(){t(await(0,h.getApplications)())}r()},[]),_jsx(h.List,{isLoading:e.length===0,searchBarPlaceholder:"Filter applications by name..."},e.map(r=>_jsx(hs,{key:r.bundleId,application:r})))}async function ms(){let t=await ln(`
  tell application "Finder"
    set theItems to selection
  end tell

  set itemsPaths to ""

  repeat with itemRef in theItems
    set theItem to POSIX path of (itemRef as string)
    set itemsPaths to itemsPaths & theItem & return
  end repeat

  return itemsPaths
  `);return t===""?[]:t.split("\r")}function hs(e){let t=e.application;return _jsx(h.List.Item,{key:t.bundleId,title:t.name,icon:{fileIcon:t.path},actions:_jsx(h.ActionPanel,null,_jsx(h.ActionPanelItem,{title:`Open with ${t.name}`,onAction:async()=>{let r=await ms();r.length===0?await(0,h.showHUD)("\u26A0\uFE0F  No Finder selection to open."):r.forEach(n=>{(0,dn.execSync)(`open -b ${t.bundleId} "${n.replace(/"/g,'\\"')}"`)}),(0,h.closeMainWindow)(),(0,h.popToRoot)({clearSearchBar:!0})}}))})}0&&(module.exports={});
