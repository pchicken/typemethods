import macros

macro typemethod*(t: typedesc, fn: untyped): untyped =
    fn.expectKind nnkProcDef
    result = fn
    let typeParam = nnkIdentDefs.newTree(
        ident("TYPEMETHOD_TYPE"),
        nnkBracketExpr.newTree(
            ident("typedesc"),
            t,
        ),
        newEmptyNode(),
    )
    result[3].insert(1, typeParam)
