const addIter = (a, b) => {
    return a == 0 ? b : addIter(a - 1, b + 1)
}

const addRecur = (a, b) => {
    return a == 0 ? b : (1 + addRecur(a - 1, b))
}