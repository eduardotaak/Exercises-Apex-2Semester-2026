public Decimal computeTip(Decimal total, Integer percent) {
    Decimal valorTotal;
    valorTotal = (total * (percent/100.0));
    return valorTotal;
}