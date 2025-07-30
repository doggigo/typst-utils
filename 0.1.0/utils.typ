#let application(..elements, displaymode: false) = {
  if displaymode {
    $display(cases(
    delim: "|",
    #elements.at(0) &-> &#elements.at(1),
    #if displaymode {
      for i in range(2, elements.pos().len(), step: 2) { $(#elements.at(i) & |-> & #elements.at(i + 1))$ }
    } else { for i in range(2, elements.pos().len(), step: 2) { $#elements.at(i) & |-> & #elements.at(i + 1)$ } }
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

#let bigoperp = math.op($#image("perp.svg",width: 1.4em)$,limits:true)
#let operp = math.op($#image("perp.svg",width: .75em)$)
#let bigosum = $plus.circle.big$
#let osum = $plus.circle$
#let Sup = math.op($"Sup"$, limits: true)
#let Inf = math.op($"Inf"$, limits: true)
#let Max = math.op($"Max"$, limits: true)
#let Min = math.op($"Min"$, limits: true)
#let smallo = math.op($"o"$, limits: true)
#let bigo = math.op($cal(O)$, limits: true)
#let ch = math.op($"ch"$)
#let sh = math.op($"sh"$)
#let th = math.op($"th"$)
#let Vect = math.op($"Vect"$)
#let Ker = math.op($"Ker"$)
#let fIm = math.op($"Im"$)
#let Cov = math.op($"Cov"$)
#let Esp = math.op($sans(E)$)
#let Var = math.op($sans(V)$)
#let Card = math.op($"Card"$)
#let bigosum = sym.plus.circle.big
#let scal(x,y) = $(#x thin mid(|) thin #y)$
#let vdots = math.dots.v
#let transp(x) = $attach(#x, tl: t)$

#let serif(body) = {
  set text(font: "New Computer Modern", style: "normal")
  body
}

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