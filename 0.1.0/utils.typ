#import "@preview/physica:0.9.7": evaluated
#import "@preview/mannot:0.2.2": markrect

#let application(..elements, displaymode: false) = {
  if displaymode {
    $display(cases(
    delim: "|",
    #elements.at(0) &-> &#elements.at(1),
    #if displaymode {
      for i in range(2, elements.pos().len(), step: 2) { $(#elements.at(i) & |-> & #elements.at(i + 1))$ }
    } else { for i in range(2, elements.pos().len(), step: 2) { $#elements.at(i) & |-> & #elements.at(i + 1)$
    } }
  ))$
  } else {
    $cases(
    delim: "|",
    #elements.at(0) &-> &#elements.at(1),
    #if displaymode {
      for i in range(2, elements.pos().len(), step: 2) { 
        $#elements.at(i) & |-> & #elements.at(i + 1)$ 
      }
    } else { 
      for i in range(2, elements.pos().len(), step: 2) { 
        $#elements.at(i) & |-> & #elements.at(i + 1)$ 
        } 
      }
  )
  $
  }
}

#let aufranc = {
  (fleche: sym.triangle.filled.r)
}

#let point(n) = $#n aufranc.fleche$

#let airy-text(body, leading: 1.2em) = {
  par(leading: leading)[#body]
}

#let airy-paragraph(body, leading: 1.2em, spacing: 1.2em) = {
  stack([
    #set par(leading: leading, spacing: spacing)
    #body
  ])
}


#let blocky-text(body, leading: 0.8em) = airy-text(body, leading: leading)
#let blocky-paragraph(body, leading: 0.8em, spacing: 0.8em) ={
  set list(marker: [#sym.ast.op])
  airy-paragraph(body, leading: leading, spacing: spacing)
}


#let matdet(..args) = math.mat(delim: "|",..args)
#let det = math.op("det",limits:false)
#let sgn = math.op($"sgn"$)
#let bigosum = $plus.o.big$
#let osum = $plus.o$
#let bigoperp = math.op($#image("perp.svg",width: 1.4em)$,limits:true)
#let operp = math.op($#image("perp.svg",width: .75em)$)
#let operp2 = $osum^perp$

#let ortho = $perp$
#let oortho = $operp2$

#let restr(f,E) = $evaluated(#f)_#E$

#let nint(a,b) = $[|a,b|]$

#let boxed(..args) = markrect(padding:.2em,..args)

#let car = $"car"$
#let Id = $"Id"$
#let Rg = $"Rg"$
#let Cl = math.op($C l$)
#let biguniondisj = math.op($union.sq.big$, limits:true)
#let uniondisj = $union.sq$
#let bigunion = math.op($union.big$, limits: true)
#let biginter = math.op($inter.big$, limits: true)
#let limsup = math.op("limsup",limits: true)
#let Sup = math.op($"Sup"$, limits: true)
#let Inf = math.op($"Inf"$, limits: true)
#let Max = math.op($"Max"$, limits: true)
#let Min = math.op($"Min"$, limits: true)
#let smallo = math.op($"o"$, limits: true)
#let bigo = math.op($cal(O)$, limits: true)
#let ch = math.op($"ch"$)
#let sh = math.op($"sh"$)
#let th = math.op($"th"$)
#let Argch = math.op($"Argch"$)
#let Argsh = math.op($"Argsh"$)
#let Argth = math.op($"Argth"$)
#let Arccos = math.op($"Arccos"$)
#let Arcsin = math.op($"Arcsin"$)
#let Arctan = math.op($"Arctan"$)
#let Vect = math.op($"Vect"$)
#let Ker = math.op($"Ker"$)
#let fIm = math.op($"Im"$)
#let Cov = math.op($"Cov"$)
#let Esp = math.op($sans(E)$)
#let Esp2 = math.op($EE$)
#let Var = math.op($sans(V)$)
#let Var2 = math.op($"Var"$)
#let Card = math.op($"Card"$)
#let Sp = math.op($"Sp"$)
#let scal(x,y) = $(#x thin mid(|) thin #y)$
#let scal2(x,y) = $chevron.l #x,#y chevron.r$
#let vdots = math.dots.v
#let transp(x) = $attach(#x, tl: t)$
#let lperp(x) = $attach(#x, tl: perp)$
#let Bf = $B_f$
#let Bf2 = $overline(B)$
#let Is = math.op($"Is"$)
#let Tr = math.op($"Tr"$)
#let Mat = math.op($"Mat"$)
#let Lin = math.op($cal(L)$)
#let mod(p) = $"  "[#p]$
#let indep = $tack.t.double$
#let sur = $\/$
#let cdot = $dot.c$
#let cst = $"cst"$
#let isommorphic = $tilde.equiv$
#let ddots = $dots.down$
#let Re = math.op($"Re"$)
#let Im = math.op($"Im"$)
#let iint = $integral.double$
#let iiint = $integral.triple$
#let iiiint = $integral.quad$
#let oint = $integral.cont$
#let oiint = $integral.surf$
#let oiiint = $integral.vol$
#let ni = $in.rev$

#let GL = $G L$

#let tuple(..args) = [
  #sym.angle.l#args.pos().join(", ")#sym.angle.r
  ]

#let serif(body) = {
  set text(font: "New Computer Modern", style: "normal")
  body
}

#let triplenorm(x) = math.op($lr(bar.v.triple #x bar.v.triple)$)

#let ita(body) = {
  set text(font: "New Computer Modern", style: "italic")
  body
}

#let context-block(body, margin-top: 1em) = {
  let pad = 15pt;
  set list(marker: [#sym.ast.op])
  set text(font: "New Computer Modern Sans", style: "italic")
  if (context text.font) != "new computer modern sans" {
    set text(font: "New Computer Modern", style: "normal")
  }
  block(above: margin-top)[
    #rect(
    stroke: (left: 0.5pt + black),
    width: 90%,
    inset: (left: pad)
    )[
    #align(left, [#body])
    ]
  ]
}

#let casesn(..args, space: math.med, start: 1) = {
  math.cases(
    ..args.named(),
    ..args.pos().enumerate(start: start).map(((i, elt)) => {
      $elt & space space ita("("#i")")$
    }))
}

#let aaa = $cal(a)$
#let bbb = $cal(b)$
#let ccc = $cal(c)$
#let ddd = $cal(d)$
#let eee = $cal(e)$
#let fff = $cal(f)$
#let ggg = $cal(g)$
#let hhh = $cal(h)$
#let iii = $cal(i)$
#let jjj = $cal(j)$
#let kkk = $cal(k)$
#let lll = $cal(l)$
#let mmm = $cal(m)$
#let nnn = $cal(n)$
#let ooo = $cal(o)$
#let ppp = $cal(p)$
#let qqq = $cal(q)$
#let rrr = $cal(r)$
#let sss = $cal(s)$
#let ttt = $cal(t)$
#let uuu = $cal(u)$
#let vvv = $cal(v)$
#let www = $cal(w)$
#let xxx = $cal(x)$
#let yyy = $cal(y)$
#let zzz = $cal(z)$
#let AAA = $cal(A)$
#let BBB = $cal(B)$
#let CCC = $cal(C)$
#let DDD = $cal(D)$
#let EEE = $cal(E)$
#let FFF = $cal(F)$
#let GGG = $cal(G)$
#let HHH = $cal(H)$
#let III = $cal(I)$
#let JJJ = $cal(J)$
#let KKK = $cal(K)$
#let LLL = $cal(L)$
#let MMM = $cal(M)$
#let NNN = $cal(N)$
#let OOO = $cal(O)$
#let PPP = $cal(P)$
#let QQQ = $cal(Q)$
#let RRR = $cal(R)$
#let SSS = $cal(S)$
#let TTT = $cal(T)$
#let UUU = $cal(U)$
#let VVV = $cal(V)$
#let WWW = $cal(W)$
#let XXX = $cal(X)$
#let YYY = $cal(Y)$
#let ZZZ = $cal(Z)$

#let aaaa = $scr(a)$
#let bbbb = $scr(b)$
#let cccc = $scr(c)$
#let dddd = $scr(d)$
#let eeee = $scr(e)$
#let ffff = $scr(f)$
#let gggg = $scr(g)$
#let hhhh = $scr(h)$
#let iiii = $scr(i)$
#let jjjj = $scr(j)$
#let kkkk = $scr(k)$
#let llll = $scr(l)$
#let mmmm = $scr(m)$
#let nnnn = $scr(n)$
#let oooo = $scr(o)$
#let pppp = $scr(p)$
#let qqqq = $scr(q)$
#let rrrr = $scr(r)$
#let ssss = $scr(s)$
#let tttt = $scr(t)$
#let uuuu = $scr(u)$
#let vvvv = $scr(v)$
#let wwww = $scr(w)$
#let xxxx = $scr(x)$
#let yyyy = $scr(y)$
#let zzzz = $scr(z)$
#let AAAA = $scr(A)$
#let BBBB = $scr(B)$
#let CCCC = $scr(C)$
#let DDDD = $scr(D)$
#let EEEE = $scr(E)$
#let FFFF = $scr(F)$
#let GGGG = $scr(G)$
#let HHHH = $scr(H)$
#let IIII = $scr(I)$
#let JJJJ = $scr(J)$
#let KKKK = $scr(K)$
#let LLLL = $scr(L)$
#let MMMM = $scr(M)$
#let NNNN = $scr(N)$
#let OOOO = $scr(O)$
#let PPPP = $scr(P)$
#let QQQQ = $scr(Q)$
#let RRRR = $scr(R)$
#let SSSS = $scr(S)$
#let TTTT = $scr(T)$
#let UUUU = $scr(U)$
#let VVVV = $scr(V)$
#let WWWW = $scr(W)$
#let XXXX = $scr(X)$
#let YYYY = $scr(Y)$
#let ZZZZ = $scr(Z)$

#let bar(x) = $overline(#x)$

#let given(A,B) = $#A mid(|) #B$