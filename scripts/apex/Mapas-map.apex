// verificando o total das taxas das listas conta corrente e conta poupanca
List<Conta> contas  = new List<Conta>();
ContaCorrente cc1 = new ContaCorrente(001, 'maria');
cc1.depositar(100);
contas.add(cc1);

ContaCorrente cc2 = new ContaCorrente(002, 'pedro');
cc2.depositar(100);
contas.add(cc2);

ContaPoupanca cp1 = new ContaPoupanca(001, 'eduardo');
cp1.depositar(1000);
contas.add(cp1);

// usando o map para puxar uma conta pelo seu indice
Map<Integer, Conta> acc = new Map<Integer, Conta>();
for(Integer i = 0; i < contas.size(); i++){
    acc.put(i, contas[i]);
}

Conta account = acc.get(2);
System.debug(account);